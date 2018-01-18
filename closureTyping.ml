open Closure

exception Unify of Type.t * Type.t
exception Error of t * Type.t * Type.t

let ext_env = ref MiniMap.empty

let rec unify t1 t2 =
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
  | Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
    (try List.iter2 unify t1s t2s
     with Invalid_argument(_) -> raise (Unify(t1, t2)));
    unify t1' t2'
  | Type.Tuple(t1s), Type.Tuple(t2s) ->
    

let rec infer_id env e =
  try
    if MiniMap.mem e env then
      MiniMap.find x env
    else if MiniMap.mem e !ext_env then
      MiniMap.find x !ext_env
    else

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
      if t1 = Type.Bool || t2 = Type.Bool then
        (unify Type.Bool t1;
         unify Type.Bool t2;
         Type.Bool)
      else if t1 = Type.Int || t2 = Type.Int then
        (unify Type.Int t1;
         unify Type.Int t2;
         Type.Bool)
      else
        (unify t1 t2; t1)
    | FNeg(e) ->
      unify Type.Float (infer_id env e);
      Type.Float
    | FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) ->
      unify Type.Float (infer_id env e1);
      unify Type.Float (infer_id env e2);
      Type.Float
    (* TODO: LEの方は大小関係が定義されていない型を除いたほうがいい？ *)
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
    | Var(x) ->
      Format.eprintf "free variable %s assumed as external@." x;
      let t = Type.gen_type () in
      ext_env := MiniMap.add x t !ext_env;
      t
    | MakeCls((x, t), { entry = l; actual_free_var = vs }) ->
      (* TODO: クロージャの型推論？ *)
    | AppCls(e, es) ->
      let t = Type.gen_type () in
      unify (infer_id env e) (Type.Fun(List.map (infer_id env) es, t));
      t
    | AppDir(l, es) ->
      let t = Type.gen_type () in
      unify (infer_label env e) (Type.Fun(List.map (infer_id env) es, t));
      t
    | Tuple(es) -> Type.Tuple(List.map (infer_id env) es)
    | NTuple(es, t) ->
      let t1 = Type.Tuple(List.map (infer_id env) es) in
      unify t1 t;
      t
    | LetTuple(xts, x, e) ->
      unify (Type.Tuple(List.map snd xts)) (infer_id env x);
      infer_exp (MiniMap.add_list xts env) e
    | I2F(e) ->
      unify Type.Int (infer_id env e);
      Type.Float
    | F2I(e) ->
      unify Type.Float (infer_id env e);
      Type.Int
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
    | ExtVar(l, t) -> (* TODO: 外部変数は？ *
    | ExtArray(l) -> (* TODO: 外部配列は？ *)
    with Unify(t1, t2) ->
    failwith (Printf.sprintf "unify error correct: %s, wrong: %s.\n%s." (string_of_type (deref_type t1)) (string_of_type (deref_type t2)) (string_of_syntax e))

let main e =
  ext_env := MiniMap.empty;
