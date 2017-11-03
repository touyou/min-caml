open Syntax

exception Unify of Type.t * Type.t
exception Error of t * Type.t * Type.t

let ext_env = ref MiniMap.empty

let gen_env = ref MiniMap.empty

let rec string_of_type = function
  | Type.Unit -> "Unit"
  | Type.Bool -> "Bool"
  | Type.Int -> "Int"
  | Type.Float -> "Float"
  | Type.Fun(t1, t2) -> (string_of_type (Type.Tuple(t1))) ^ " -> " ^ (string_of_type t2)
  | Type.Tuple(ts) -> "(" ^ (string_of_types ts) ^ ")"
  | Type.Array(t) -> "[" ^ (string_of_type t) ^ "]"
  | Type.Var(t) ->
    let t' = !t in (match t' with Some(t2) -> string_of_type t2 | None -> "T")
and string_of_types = function
  | [] -> ""
  | t :: [] -> string_of_type t
  | t :: tr -> (string_of_type t) ^ ", " ^ (string_of_types tr)

(* 型変数を中身で置き換える *)
let rec deref_type = function
  | Type.Fun(t1s, t2) -> Type.Fun(List.map deref_type t1s, deref_type t2)
  | Type.Tuple(ts) -> Type.Tuple(List.map deref_type ts)
  | Type.Array(t) -> Type.Array(deref_type t)
  | Type.Var({ contents = None } as r) ->
      Format.eprintf "uninstantiated type variable detected; assuming int@.";
      r := Some(Type.Int);
      Type.Int
  | Type.Var({ contents = Some(t) } as r) ->
      let t' = deref_type t in
      r := Some(t');
      t'
  | t -> t

let rec deref_id_type (x, t) = (x, deref_type t)

let rec deref_term = function
  | Not(e) -> Not(deref_term e)
  | Neg(e) -> Neg(deref_term e)
  | Add(e1, e2) -> Add(deref_term e1, deref_term e2)
  | Sub(e1, e2) -> Sub(deref_term e1, deref_term e2)
  | Mul(e1, e2) -> Mul(deref_term e1, deref_term e2)
  | Div(e1, e2) -> Div(deref_term e1, deref_term e2)
  | Xor(e1, e2) -> Xor(deref_term e1, deref_term e2)
  | Or(e1, e2) -> Or(deref_term e1, deref_term e2)
  | And(e1, e2) -> And(deref_term e1, deref_term e2)
  | Sll(e1, e2) -> Sll(deref_term e1, deref_term e2)
  | Srl(e1, e2) -> Srl(deref_term e1, deref_term e2)
  | Eq(e1, e2) -> Eq(deref_term e1, deref_term e2)
  | LE(e1, e2) -> LE(deref_term e1, deref_term e2)
  | FNeg(e) -> FNeg(deref_term e)
  | FAdd(e1, e2) -> FAdd(deref_term e1, deref_term e2)
  | FSub(e1, e2) -> FSub(deref_term e1, deref_term e2)
  | FMul(e1, e2) -> FMul(deref_term e1, deref_term e2)
  | FDiv(e1, e2) -> FDiv(deref_term e1, deref_term e2)
  | If(e1, e2, e3) -> If(deref_term e1, deref_term e2, deref_term e3)
  | Let(xt, e1, e2) -> Let(deref_id_type xt, deref_term e1, deref_term e2)
  | LetDef(xt, e1) -> LetDef(deref_id_type xt, deref_term e1)
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
      LetRec({ name = deref_id_type xt;
               args = List.map deref_id_type yts;
               body = deref_term e1 },
             deref_term e2)
  | LetRecDef({ name = xt; args = yts; body = e1 }) ->
      LetRecDef({ name = deref_id_type xt;
                  args = List.map deref_id_type yts;
                  body = deref_term e1 })
  | App(e, es) -> App(deref_term e, List.map deref_term es)
  | Tuple(es) -> Tuple(List.map deref_term es)
  | LetTuple(xts, e1, e2) -> LetTuple(List.map deref_id_type xts, deref_term e1, deref_term e2)
  | Array(e1, e2) -> Array(deref_term e1, deref_term e2)
  | In(e1) -> In(deref_term e1)
  | Out(e1) -> Out(deref_term e1)
  | Get(e1, e2) -> Get(deref_term e1, deref_term e2)
  | Put(e1, e2, e3) -> Put(deref_term e1, deref_term e2, deref_term e3)
  | e -> e

(* 出現チェック *)
let rec occur r1 = function
  | Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
  | Type.Tuple(t2s) -> List.exists (occur r1) t2s
  | Type.Array(t2) -> occur r1 t2
  | Type.Var(r2) when r1 == r2 -> true
  | Type.Var({ contents = None }) -> false
  | Type.Var({ contents = Some(t2) }) -> occur r1 t2
  | _ -> false

(* 型変数への代入 *)
let rec unify t1 t2 =
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
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
  (* 一方が未定義の型変数  *)
  | Type.Var({ contents = None } as r1), _ ->
      if occur r1 t2 then raise (Unify(t1, t2));
      r1 := Some(t2)
  | _, Type.Var({ contents = None } as r2) ->
      if occur r2 t1 then raise (Unify(t1, t2));
      r2 := Some(t1)
  | _, _ -> raise (Unify(t1, t2))

(* 型推論ルーチン *)
let rec infer env e =
  try
    match e with
    | Unit -> Type.Unit
    | Bool(_) -> Type.Bool
    | Int(_) -> Type.Int
    | Float(_) -> Type.Float
    | Not(e) ->
        unify Type.Bool (infer env e);
        Type.Bool
    | Neg(e) ->
        unify Type.Int (infer env e);
        Type.Int
    | Add(e1, e2) | Sub(e1, e2) | Mul(e1, e2) | Div(e1, e2)
    | Xor(e1, e2) | Or(e1, e2) | And(e1, e2)
    | Sll(e1, e2) | Srl(e1, e2) ->
        unify Type.Int (infer env e1);
        unify Type.Int (infer env e2);
        Type.Int
    | FNeg(e) ->
        unify Type.Float (infer env e);
        Type.Float
    | FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) ->
        unify Type.Float (infer env e1);
        unify Type.Float (infer env e2);
        Type.Float
    | Eq(e1, e2) | LE(e1, e2) ->
        unify (infer env e1) (infer env e2);
        Type.Bool
    | If(e1, e2, e3) ->
        unify (infer env e1) Type.Bool;
        let t2 = infer env e2 in
        let t3 = infer env e3 in
        unify t2 t3;
        t2
    | Let((x, t), e1, e2) ->
        unify t (infer env e1);
        infer (MiniMap.add x t env) e2
    | LetDef((x, t), e1) ->
        unify t (infer env e1);
        gen_env := MiniMap.add x t !gen_env;
        Type.Unit
    | Var(x) when MiniMap.mem x env -> MiniMap.find x env
    | Var(x) when MiniMap.mem x !gen_env -> MiniMap.find x !gen_env
    | Var(x) when MiniMap.mem x !ext_env -> MiniMap.find x !ext_env
    | Var(x) ->
        Format.eprintf "free variable %s assumed as external@." x;
        let t = Type.gen_type () in
        ext_env := MiniMap.add x t !ext_env;
        t
    | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
        let env = MiniMap.add x t env in
        unify t (Type.Fun(List.map snd yts, infer (MiniMap.add_list yts env) e1));
        infer env e2
    | LetRecDef({ name = (x, t); args = yts; body = e1 }) ->
        let env = MiniMap.add x t env in
        gen_env := MiniMap.add x t !gen_env;
        unify t (Type.Fun(List.map snd yts, infer (MiniMap.add_list yts env) e1));
        Type.Unit
    | App(e, es) ->
        let t = Type.gen_type () in
        unify (infer env e) (Type.Fun(List.map (infer env) es, t));
        t
    | Tuple(es) -> Type.Tuple(List.map (infer env) es)
    | LetTuple(xts, e1, e2) ->
        unify (Type.Tuple(List.map snd xts)) (infer env e1);
        infer (MiniMap.add_list xts env) e2
    | Array(e1, e2) ->
        unify (infer env e1) Type.Int;
        Type.Array(infer env e2)
    | In(e1) ->
        unify Type.Unit (infer env e1);
        Type.Int
    | Out(e1) ->
        unify Type.Int (infer env e1);
        Type.Unit
    | Get(e1, e2) ->
        let t = Type.gen_type () in
        unify (Type.Array(t)) (infer env e1);
        unify Type.Int (infer env e2);
        t
    | Put(e1, e2, e3) ->
        let t = infer env e3 in
        unify (Type.Array(t)) (infer env e1);
        unify Type.Int (infer env e2);
        Type.Unit
  with Unify(t1, t2) ->
    failwith (Printf.sprintf "unify error correct: %s wrong: %s." (string_of_type (deref_type t1)) (string_of_type (deref_type t2)))
    (*raise (Error(deref_term e, deref_type t1, deref_type t2)))*)

let main e =
  ext_env := MiniMap.empty;
  (try unify Type.Unit (infer MiniMap.empty e)
   with Unify(t1, t2) -> failwith "top level does not have type unit.");
  ext_env := MiniMap.map deref_type !ext_env;
  gen_env := MiniMap.map deref_type !gen_env;
  deref_term e
