open Id
open Type
open Syntax
open Closure
open Asm

let string_of_id id = id

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

let rec string_of_nest n =
  if n = 0 then ""
  else "  " ^ (string_of_nest (n-1))

let string_of_syntax elem =
  let rec string_of_syntax' nest elem =
    (string_of_nest nest) ^ (match elem with
        | Syntax.Unit -> "()"
        | Syntax.Bool(e) -> if e then "true" else "false"
        | Syntax.Int(e) -> string_of_int e
        | Syntax.Float(e) -> string_of_float e
        | Syntax.Not(e) -> "not(" ^ (string_of_syntax' 0 e) ^ ")"
        | Syntax.Neg(e) | Syntax.FNeg(e) -> "-(" ^ (string_of_syntax' 0 e) ^ ")"
        | Syntax.Add(e1, e2) | Syntax.FAdd(e1, e2) -> "(" ^ (string_of_syntax' 0 e1) ^ " + " ^ (string_of_syntax' 0 e2) ^ ")"
        | Syntax.Sub(e1, e2) | Syntax.FSub(e1, e2) -> "(" ^ (string_of_syntax' 0 e1) ^ " - " ^ (string_of_syntax' 0 e2) ^ ")"
        | Syntax.Mul(e1, e2) | Syntax.FMul(e1, e2) -> "(" ^ (string_of_syntax' 0 e1) ^ " * " ^ (string_of_syntax' 0 e2) ^ ")"
        | Syntax.Div(e1, e2) | Syntax.FDiv(e1, e2) -> "(" ^ (string_of_syntax' 0 e1) ^ " / " ^ (string_of_syntax' nest e2) ^ ")"
        | Syntax.Eq(e1, e2) -> (string_of_syntax' 0 e1) ^ " == " ^ (string_of_syntax' 0 e2)
        | Syntax.LE(e1, e2) -> (string_of_syntax' 0 e1) ^ " <= " ^ (string_of_syntax' 0 e2)
        | Syntax.If(e1, e2, e3) ->
          "if " ^ (string_of_syntax' 0 e1) ^ " then\n" ^ (string_of_syntax' (nest+1) e2) ^ "\n"  ^ (string_of_nest nest) ^ "else\n" ^ (string_of_syntax' (nest+1) e3)
        | Syntax.Let((id, typ), e1, e2) ->
          "let " ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ " = " ^ (string_of_syntax' 0 e1) ^ " in\n" ^ (string_of_syntax' (nest+1) e2)
        | Syntax.Var id -> string_of_id id
        | Syntax.LetRec ({ name = (id, typ); args = args; body = e1}, e2) ->
          "let rec (" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ") " ^ "(" ^ (string_of_args args) ^ ") = " ^ (string_of_syntax' 0 e1) ^ " in\n" ^ (string_of_syntax' (nest+1) e2)
        | Syntax.App(e, es) -> (string_of_syntax' 0 e) ^ "(" ^ (string_of_elems es) ^ ")"
        | Syntax.Tuple(es) -> "(" ^ string_of_elems es ^ ")"
        | Syntax.LetTuple(args, e1, e2) -> "let (" ^ (string_of_args args) ^ ") = " ^ (string_of_syntax' 0 e1) ^ " in\n" ^ (string_of_syntax' (nest+1) e2)
        | Syntax.Array(e1, e2) -> "Array.create " ^ (string_of_syntax' 0 e1) ^ " " ^ (string_of_syntax' 0 e2)
        | Syntax.Get(e1, e2) -> (string_of_syntax' 0 e1) ^ ".(" ^ (string_of_syntax' 0 e2) ^ ")"
        | Syntax.Put(e1, e2, e3) -> (string_of_syntax' 0 e1) ^ ".(" ^ (string_of_syntax' 0 e2) ^ ") <- " ^ (string_of_syntax' 0 e3)
      )
  and string_of_args = function
    | [] -> ""
    | (id, typ) :: [] -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ")"
    | (id, typ) :: args -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ "), " ^ (string_of_args args)
  and string_of_elems = function
    | [] -> ""
    | e :: [] -> string_of_syntax' 0 e
    | e :: er -> (string_of_syntax' 0 e) ^ ", " ^ (string_of_elems er)
  in string_of_syntax' 0 elem

let string_of_knormal elem =
  let rec string_of_knormal' nest elem =
    (string_of_nest nest) ^ (match elem with
        | KNormal.Unit -> "()"
        | KNormal.Int(e) -> string_of_int e
        | KNormal.Float(e) -> string_of_float e
        | KNormal.Neg(e) | KNormal.FNeg(e) -> "-(" ^ (string_of_id e) ^ ")"
        | KNormal.Add(e1, e2) | KNormal.FAdd(e1, e2) -> "(" ^ (string_of_id e1) ^ " + " ^ (string_of_id e2) ^ ")"
        | KNormal.Sub(e1, e2) | KNormal.FSub(e1, e2) -> "(" ^ (string_of_id e1) ^ " - " ^ (string_of_id e2) ^ ")"
        | KNormal.Mul(e1, e2) | KNormal.FMul(e1, e2) -> "(" ^ (string_of_id e1) ^ " * " ^ (string_of_id e2) ^ ")"
        | KNormal.Div(e1, e2) | KNormal.FDiv(e1, e2) -> "(" ^ (string_of_id e1) ^ " / " ^ (string_of_id e2) ^ ")"
        | KNormal.IfEq(id1, id2, e1, e2) ->
          "if " ^ (string_of_id id1) ^ " == " ^ (string_of_id id2) ^ " then\n" ^ (string_of_knormal' (nest+1) e1) ^ "\n" ^ (string_of_nest nest) ^ "else\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.IfLE(id1, id2, e1, e2) ->
          "if " ^ (string_of_id id1) ^ " <= " ^ (string_of_id id2) ^ " then\n" ^ (string_of_knormal' (nest+1) e1) ^ "\n" ^ (string_of_nest nest) ^ "else\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.Let((id, typ), e1, e2) ->
          "let " ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ " = " ^ (string_of_knormal' 0 e1) ^ " in\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.Var(e) -> string_of_id e
        | KNormal.LetRec({ KNormal.name = (id, typ); KNormal.args = args; KNormal.body = e1}, e2) ->
          "let rec (" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ") (" ^ (string_of_args args) ^ ") = " ^ (string_of_knormal' 0 e1) ^ " in\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.App(e, es) | KNormal.ExtFunApp(e, es) -> (string_of_id e) ^ "(" ^ (string_of_elems es) ^ ")"
        | KNormal.Tuple(es) -> "(" ^ (string_of_elems es) ^ ")"
        | KNormal.LetTuple(args, id, e) ->
          "let " ^ (string_of_args args) ^ ") = " ^ (string_of_id id) ^ " in\n" ^ (string_of_knormal' 0 e)
        | KNormal.Get(e1, e2) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ")"
        | KNormal.Put(e1, e2, e3) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ") <- " ^ (string_of_id e3)
        | KNormal.ExtVar(id, typ) -> (string_of_id id) ^ ": " ^ (string_of_type typ)
        | KNormal.ExtArray(e) -> "[" ^ (string_of_id e) ^ "]"
      )
  and string_of_args = function
    | [] -> ""
    | (id, typ) :: [] -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ")"
    | (id, typ) :: args -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ "), " ^ (string_of_args args)
  and string_of_elems = function
    | [] -> ""
    | e :: [] -> string_of_id e
    | e :: er -> (string_of_id e) ^ ", " ^ (string_of_elems er)
  in string_of_knormal' 0 elem

let string_of_closure elem =
  let rec string_of_closure' nest elem =
    (string_of_nest nest) ^ (match elem with
      | Closure.Unit -> "()"
      | Closure.Int(e) -> string_of_int e
      | Closure.Float(e) -> string_of_float e
      | Closure.Neg(e) | Closure.FNeg(e) -> "-(" ^ (string_of_id e) ^ ")"
      | Closure.Add(e1, e2) | Closure.FAdd(e1, e2) -> "(" ^ (string_of_id e1) ^ " + " ^ (string_of_id e2) ^ ")"
      | Closure.Sub(e1, e2) | Closure.FSub(e1, e2) -> "(" ^ (string_of_id e1) ^ " - " ^ (string_of_id e2) ^ ")"
      | Closure.Mul(e1, e2) | Closure.FMul(e1, e2) -> "(" ^ (string_of_id e1) ^ " * " ^ (string_of_id e2) ^ ")"
      | Closure.Div(e1, e2) | Closure.FDiv(e1, e2) -> "(" ^ (string_of_id e1) ^ " / " ^ (string_of_id e2) ^ ")"
      | Closure.IfEq(id1, id2, e1, e2) ->
        "if " ^ (string_of_id id1) ^ " == " ^ (string_of_id id2) ^ " then\n" ^ (string_of_closure' (nest+1) e1) ^ "\n" ^ (string_of_nest nest) ^ "else\n" ^ (string_of_closure' (nest+1) e2)
      | Closure.IfLE(id1, id2, e1, e2) ->
        "if " ^ (string_of_id id1) ^ " == " ^ (string_of_id id2) ^ " then\n" ^ (string_of_closure' (nest+1) e1) ^ "\n" ^ (string_of_nest nest) ^ "else\n" ^ (string_of_closure' (nest+1) e2)
      | Closure.Let((id, typ), e1, e2) ->
        "let " ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ " = " ^ (string_of_closure' 0 e1) ^ " in\n" ^ (string_of_closure' (nest+1) e2)
      | Closure.Var(x) -> string_of_id x
      | Closure.MakeCls((id, typ), { entry = Id.Label(l); actual_free_var = ys }, e) -> "MakeCls"
      | Closure.AppCls(x, xs) -> "AppCls"
      | Closure.AppDir(l, xs) -> "AppDir"
      | Closure.Tuple(xs) -> "Tuple"
      | Closure.LetTuple(xts, x, t) -> "LetTuple"
      | Closure.Get(e1, e2) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ")"
      | Closure.Put(e1, e2, e3) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ") <- " ^ (string_of_id e3)
      | Closure.ExtVar(Id.Label(l), t) -> l ^ ": " ^ (string_of_type t)
      | Closure.ExtArray(Id.Label(l)) -> "[" ^ l ^ "]"
      )
  in string_of_closure' 0 elem

