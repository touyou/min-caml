open Closure

exception Unify of Type.t * Type.t
exception Error of t * Type.t * Type.t

let ext_env = ref MiniMap.empty
let label_env = ref MiniMap.empty

let rec occur r1 = function
  | Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
  | Type.Tuple(t2s) -> List.exists (occur r1) t2s
  | Type.Array(t2) -> occur r1 t2
  | Type.Var(r2) when r1 == r2 -> true
  | Type.Var({ contents = None }) -> false
  | Type.Var({ contents = Some(t2) }) -> occur r1 t2
  | _ -> false

let rec unify t1 t2 =
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
  | Type.Bool, Type.Int | Type.Int, Type.Bool -> () (* この時すでに全てのtrue, falseが1, 0に変換されてしまっているため  *)
  | Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
    (try List.iter2 unify t1s t2s
     with Invalid_argument(_) -> raise (Unify(t1, t2)));
    unify t1' t2'
  | Type.Tuple(t1s), Type.Tuple(t2s) ->
    (try List.iter2 unify t1s t2s
     with Invalid_argument(_) -> raise (Unify(t1, t2)))
  | Type.Array(t1), Type.Array(t2) -> unify t1 t2
  | Type.Var(r1), Type.Var(r2) when r1 == r2 -> ()
  | Type.Var({ contents = Some(t1') }), _ -> unify t1' t2
  | _, Type.Var({ contents = Some(t2') }) -> unify t1 t2'
  | Type.Var({ contents = None } as r1), _ ->
    if occur r1 t2 then raise (Unify(t1, t2));
    r1 := Some(t2)
  | _, Type.Var({ contents = None } as r2) ->
    if occur r2 t1 then raise (Unify(t1, t2));
    r2 := Some(t1)
  | _, _ -> raise (Unify(t1, t2))

let rec infer_id env e =
  if MiniMap.mem e env then
    MiniMap.find e env
  else if MiniMap.mem e !ext_env then
    MiniMap.find e !ext_env
  else if MiniMap.mem e !label_env then
    MiniMap.find e !label_env
  else if e = "min_caml_create_array" then
    Type.Fun(Type.Int::(Type.gen_type ())::[], (Type.gen_type ()))
  else if e = "min_caml_create_float_array" then
    Type.Fun(Type.Int::Type.Float::[], (Type.gen_type ()))
  else
    failwith (Printf.sprintf "Not found id while closure typing: %s" e)

let rec infer_exp env e =
  try
    match e with
    | Unit -> Type.Unit
    | Int(_) -> Type.Int
    | Float(_) -> Type.Float
    | Neg(e) ->
      unify Type.Int (infer_id env e);
      Type.Int
    | Add(e1, e2) | Sub(e1, e2) | Mul(e1, e2) | Div(e1, e2)
    | Sll(e1, e2) | Srl(e1, e2) ->
      unify Type.Int (infer_id env e1);
      unify Type.Int (infer_id env e2);
      Type.Int
    | Xor(e1, e2) | Or(e1, e2) | And(e1, e2) ->
      let t1 = infer_id env e1 in
      let t2 = infer_id env e2 in
      (unify t1 t2; t1)
    | FNeg(e) ->
      unify Type.Float (infer_id env e);
      Type.Float
    | FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) | FAddABS(e1, e2) ->
      unify Type.Float (infer_id env e1);
      unify Type.Float (infer_id env e2);
      Type.Float
    | IfEq(v1, v2, e1, e2) | IfLE(v1, v2, e1, e2) ->
      unify (infer_id env v1) (infer_id env v2);
      let t1 = infer_exp env e1 in
      let t2 = infer_exp env e2 in
      unify t1 t2;
      t1
    | Let((x, t), e1, e2) ->
      unify t (infer_exp env e1);
      infer_exp (MiniMap.add x t env) e2
    | Var(x) when MiniMap.mem x env -> MiniMap.find x env
    | Var(x) when MiniMap.mem x !ext_env -> MiniMap.find x !ext_env
    | Var(x) when MiniMap.mem x !label_env -> MiniMap.find x !label_env
    | Var(x) ->
      Format.eprintf "free variable %s assumed as external@." x;
      let t = Type.gen_type () in
      ext_env := MiniMap.add x t !ext_env;
      t
    | MakeCls((x, t), { entry = Label(l); actual_free_var = vs }, e) ->
      (* 型はeの型になる。基本的にxとlは同じもののはず。 *)
      let t' = infer_exp (MiniMap.add x t env) e in
      t'
    | AppCls(e, es) ->
      let t = Type.gen_type () in
      unify (infer_id env e) (Type.Fun(List.map (infer_id env) es, t));
      t
    | AppDir(Label(l), es) ->
      let t = Type.gen_type () in
      unify (infer_id env l) (Type.Fun(List.map (infer_id env) es, t));
      t
    | Tuple(es) -> Type.Tuple(List.map (infer_id env) es)
    | LetTuple(xts, x, e) ->
      unify (Type.Tuple(List.map snd xts)) (infer_id env x);
      infer_exp (MiniMap.add_list xts env) e
    | I2F(e) ->
      unify Type.Int (infer_id env e);
      Type.Float
    | F2I(e) ->
      unify Type.Float (infer_id env e);
      Type.Int
    | SQRT(e) ->
      unify Type.Float (infer_id env e);
      Type.Float
    | FABS(e) ->
      unify Type.Float (infer_id env e);
      Type.Float
    | In -> Type.Int
    | Out(e) ->
      unify Type.Int (infer_id env e);
      Type.Unit
    | Get(e1, e2) ->
      let t = Type.gen_type () in
      unify (Type.Array(t)) (infer_id env e1);
      unify Type.Int (infer_id env e2);
      t
    | Put(e1, e2, e3) ->
      let t = infer_id env e3 in
      unify (Type.Array(t)) (infer_id env e1);
      unify (Type.Int) (infer_id env e2);
      Type.Unit
    | ExtVar(Label(l), t) ->
      label_env := MiniMap.add l t !label_env;
      t
    | ExtArray(Label(l)) ->
      let t = Type.gen_type () in
      label_env := MiniMap.add l (Type.Array(t)) !label_env;
      Type.Array(t)
  with Unify(t1, t2) ->
    failwith (Printf.sprintf "unify error correct: %s, wrong: %s.\n%s." (Debug.string_of_type t1) (Debug.string_of_type t2) (Debug.string_of_closure e))

let infer_fun env e =
  let { name = (Label(l), t); args = lts; formal_free_var = lts2; body = e' } = e in
  let fun_env = MiniMap.add l t (MiniMap.add_list lts2 (MiniMap.add_list lts env)) in
  (try
     unify t (Type.Fun(List.map snd lts, (infer_exp fun_env e')))
   with Unify(t1, t2) ->
     failwith (Printf.sprintf "unify error correct: %s, wrong: %s.\n%s." (Debug.string_of_type t1) (Debug.string_of_type t2) (Debug.string_of_cl_fun e)));
  label_env := MiniMap.add l t !label_env

let rec infer env = function
  | [] -> ()
  | e :: es -> infer_fun env e; infer env es

let main e =
  ext_env := MiniMap.empty;
  let Prog(funs, e') = e in
  let _ = infer MiniMap.empty funs in
  let _ = infer_exp MiniMap.empty e' in
  ()
