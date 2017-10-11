open Id
open Type
open Syntax
open KNormal
open Closure
open Asm

let string_of_id id = id
let rec string_of_ids = function
    | [] -> ""
    | e :: [] -> string_of_id e
    | e :: er -> (string_of_id e) ^ ", " ^ (string_of_ids er)

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

let rec string_of_args = function
    | [] -> ""
    | (id, typ) :: [] -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ")"
    | (id, typ) :: args -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ "), " ^ (string_of_args args)

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
        | Syntax.Div(e1, e2) | Syntax.FDiv(e1, e2) -> "(" ^ (string_of_syntax' 0 e1) ^ " / " ^ (string_of_syntax' 0 e2) ^ ")"
        | Syntax.Eq(e1, e2) -> (string_of_syntax' 0 e1) ^ " == " ^ (string_of_syntax' 0 e2)
        | Syntax.LE(e1, e2) -> (string_of_syntax' 0 e1) ^ " <= " ^ (string_of_syntax' 0 e2)
        | Syntax.If(e1, e2, e3) ->
          "if " ^ (string_of_syntax' 0 e1) ^ " then\n"
          ^ (string_of_syntax' (nest+1) e2) ^ "\n"
          ^ (string_of_nest nest) ^ "else\n" ^ (string_of_syntax' (nest+1) e3)
        | Syntax.Let((id, typ), e1, e2) ->
          "let " ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ " =\n"
          ^ (string_of_syntax' (nest+1) e1) ^ "\n"
          ^ (string_of_nest nest) ^ "in\n" ^ (string_of_syntax' (nest+1) e2)
        | Syntax.Var id -> string_of_id id
        | Syntax.LetRec ({ name = (id, typ); args = args; body = e1}, e2) ->
          "let rec (" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ") " ^ "(" ^ (string_of_args args) ^ ") =\n"
          ^ (string_of_syntax' (nest+1) e1)
          ^ "\n" ^ (string_of_nest nest) ^ "in\n" ^ (string_of_syntax' (nest+1) e2)
        | Syntax.App(e, es) -> (string_of_syntax' 0 e) ^ "(" ^ (string_of_elems es) ^ ")"
        | Syntax.Tuple(es) -> "(" ^ string_of_elems es ^ ")"
        | Syntax.LetTuple(args, e1, e2) ->
          "let (" ^ (string_of_args args) ^ ") =\n"
          ^ (string_of_syntax' (nest+1) e1) ^ "\n" ^ (string_of_nest nest) ^ "in\n" ^ (string_of_syntax' (nest+1) e2)
        | Syntax.Array(e1, e2) -> "Array.create " ^ (string_of_syntax' 0 e1) ^ " " ^ (string_of_syntax' 0 e2)
        | Syntax.Get(e1, e2) -> (string_of_syntax' 0 e1) ^ ".(" ^ (string_of_syntax' 0 e2) ^ ")"
        | Syntax.Put(e1, e2, e3) -> (string_of_syntax' 0 e1) ^ ".(" ^ (string_of_syntax' 0 e2) ^ ") <- " ^ (string_of_syntax' 0 e3)
      )
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
          "if " ^ (string_of_id id1) ^ " == " ^ (string_of_id id2) ^ " then\n"
          ^ (string_of_knormal' (nest+1) e1) ^ "\n" 
          ^ (string_of_nest nest) ^ "else\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.IfLE(id1, id2, e1, e2) ->
          "if " ^ (string_of_id id1) ^ " <= " ^ (string_of_id id2) ^ " then\n"
          ^ (string_of_knormal' (nest+1) e1) ^ "\n"
          ^ (string_of_nest nest) ^ "else\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.Let((id, typ), e1, e2) ->
          "let " ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ " =\n"
          ^ (string_of_knormal' (nest+1) e1) ^ " in\n"
          ^ (string_of_knormal' (nest+1) e2)
        | KNormal.Var(e) -> string_of_id e
        | KNormal.LetRec({ KNormal.name = (id, typ); KNormal.args = args; KNormal.body = e1}, e2) ->
          "let rec (" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ") (" ^ (string_of_args args) ^ ") =\n"
          ^ (string_of_knormal' (nest+1) e1) ^ "\n" 
          ^ (string_of_nest nest) ^ "in\n" ^ (string_of_knormal' (nest+1) e2)
        | KNormal.App(e, ids) | KNormal.ExtFunApp(e, ids) -> (string_of_id e) ^ "(" ^ (string_of_ids ids) ^ ")"
        | KNormal.Tuple(ids) -> "(" ^ (string_of_ids ids) ^ ")"
        | KNormal.LetTuple(args, id, e) ->
          "let " ^ (string_of_args args) ^ ") =\n" 
          ^ (string_of_id id) ^ "\n"
          ^ (string_of_nest nest) ^ "in\n" ^ (string_of_knormal' 0 e)
        | KNormal.Get(e1, e2) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ")"
        | KNormal.Put(e1, e2, e3) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ") <- " ^ (string_of_id e3)
        | KNormal.ExtVar(id, typ) -> (string_of_id id) ^ ": " ^ (string_of_type typ)
        | KNormal.ExtArray(e) -> "[" ^ (string_of_id e) ^ "]"
      )
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
        "if " ^ (string_of_id id1) ^ " == " ^ (string_of_id id2) ^ " then\n"
        ^ (string_of_closure' (nest+1) e1) ^ "\n"
        ^ (string_of_nest nest) ^ "else\n" ^ (string_of_closure' (nest+1) e2)
      | Closure.IfLE(id1, id2, e1, e2) ->
        "if " ^ (string_of_id id1) ^ " == " ^ (string_of_id id2) ^ " then\n"
        ^ (string_of_closure' (nest+1) e1) ^ "\n"
        ^ (string_of_nest nest) ^ "else\n" ^ (string_of_closure' (nest+1) e2)
      | Closure.Let((id, typ), e1, e2) ->
        "let " ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ " =\n"
        ^ (string_of_closure' (nest+1) e1) ^ " in\n" ^ (string_of_closure' (nest+1) e2)
      | Closure.Var(x) -> string_of_id x
      | Closure.MakeCls((id, typ), { entry = Id.Label(l); actual_free_var = ys }, e) ->
        "MakeCls (" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ") =\n"
        ^ (string_of_nest nest) ^ "(" ^ l ^ ", (" ^ (string_of_ids ys) ^ ")) in\n"
        ^ (string_of_nest nest) ^ (string_of_closure' (nest+1) e)
      | Closure.AppCls(x, xs) -> "AppCls(" ^ (string_of_id x) ^ ", " ^ (string_of_ids xs) ^ ")"
      | Closure.AppDir(Id.Label(l), xs) -> "AppDir(" ^ l ^ ", " ^ (string_of_ids xs) ^ ")"
      | Closure.Tuple(xs) -> "(" ^ (string_of_ids xs) ^ ")"
      | Closure.LetTuple(xts, x, t) ->
        "let (" ^ (string_of_args xts) ^ ") = " ^ (string_of_id x) ^ " in\n"
        ^ (string_of_closure' (nest+1) t)
      | Closure.Get(e1, e2) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ")"
      | Closure.Put(e1, e2, e3) -> (string_of_id e1) ^ ".(" ^ (string_of_id e2) ^ ") <- " ^ (string_of_id e3)
      | Closure.ExtVar(Id.Label(l), t) -> l ^ ": " ^ (string_of_type t)
      | Closure.ExtArray(Id.Label(l)) -> "[" ^ l ^ "]"
      )
  in string_of_closure' 0 elem

let string_of_cl_fun e =
  let { Closure.name = (Id.Label(l), typ); Closure.args = args; Closure.formal_free_var = fvs; Closure.body = e } = e in
  "(" ^ l ^ ": " ^ (string_of_type typ) ^ ")(" ^ (string_of_args args) ^ "; " ^ (string_of_args fvs) ^ ") =\n" ^ (string_of_closure e)

let rec string_of_cl_prog = function
  | Closure.Prog(fs, e) -> (string_of_cl_funs fs) ^ "in\n" ^ (string_of_closure e)
and string_of_cl_funs = function
  | [] -> ""
  | e :: es -> (string_of_cl_fun e) ^ "\n" ^ (string_of_cl_funs es)

let rec string_of_asm_t = function
  | Asm.Ans(exp) -> string_of_asm_exp exp
  | Asm.Let((id, typ), exp, e) -> "(" ^ (string_of_id id) ^ ": " ^ (string_of_type typ) ^ ") = "
                                  ^ (string_of_asm_exp exp) ^ "; " ^ (string_of_asm_t e)
and string_of_asm_exp = function
  | Asm.Nop -> "Nop"
  | Asm.Li(i) -> "Li(" ^ (string_of_int i) ^ ")"
  | Asm.FLi(Id.Label(l)) -> "FLi(" ^ l ^ ")"
  | Asm.SetL(Id.Label(l)) -> "SetL(" ^ l ^ ")"
  | Asm.Mr(e) -> "Mr(" ^ (string_of_id e) ^ ")"
  | Asm.Neg(e) -> "Neg(" ^ (string_of_id e) ^ ")"
  | Asm.Add(e1, Asm.Var(e2)) -> "Add(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Add(e, Asm.Const(i)) -> "Add(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Sub(e1, Asm.Var(e2)) -> "Sub(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Sub(e, Asm.Const(i)) -> "Sub(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Mul(e1, Asm.Var(e2)) -> "Mul(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Mul(e, Asm.Const(i)) -> "Mul(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Div(e1, Asm.Var(e2)) -> "Div(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Div(e, Asm.Const(i)) -> "Div(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Slw(e1, Asm.Var(e2)) -> "Slw(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Slw(e, Asm.Const(i)) -> "Slw(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Lwz(e1, Asm.Var(e2)) -> "Lwz(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Lwz(e, Asm.Const(i)) -> "Lwz(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Stw(e1, e2, Asm.Var(e3)) ->
    "Stw(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ", " ^ (string_of_id e3) ^ ")"
  | Asm.Stw(e1, e2, Asm.Const(i)) ->
    "Stw(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.FMr(e) -> "FMr(" ^ (string_of_id e) ^ ")"
  | Asm.FNeg(e) -> "FNeg(" ^ (string_of_id e) ^ ")"
  | Asm.FAdd(e1, e2) -> "FAdd(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.FSub(e1, e2) -> "FSub(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.FMul(e1, e2) -> "FMul(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.FDiv(e1, e2) -> "FDiv(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Lfd(e1, Asm.Var(e2)) -> "Lfd(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Lfd(e, Asm.Const(i)) -> "Lfd(" ^ (string_of_id e) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Stfd(e1, e2, Asm.Var(e3)) ->
    "Stfd(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ", " ^ (string_of_id e3) ^ ")"
  | Asm.Stfd(e1, e2, Asm.Const(i)) ->
    "Stfd(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ", " ^ (string_of_int i) ^ ")"
  | Asm.Comment(c) -> "Comment(\"" ^ c ^ "\")"
  | Asm.IfEq(id1, Asm.Var(id2), e1, e2) ->
    "IfEq(" ^ (string_of_id id1) ^ ", " ^ (string_of_id id2) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfEq(id, Asm.Const(i), e1, e2) ->
    "IfEq(" ^ (string_of_id id) ^ ", " ^ (string_of_int i) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfLE(id1, Asm.Var(id2), e1, e2) ->
    "IfLE(" ^ (string_of_id id1) ^ ", " ^ (string_of_id id2) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfLE(id, Asm.Const(i), e1, e2) ->
    "IfLE(" ^ (string_of_id id) ^ ", " ^ (string_of_int i) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfGE(id1, Asm.Var(id2), e1, e2) ->
    "IfEq(" ^ (string_of_id id1) ^ ", " ^ (string_of_id id2) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfGE(id, Asm.Const(i), e1, e2) ->
    "IfEq(" ^ (string_of_id id) ^ ", " ^ (string_of_int i) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfFEq(id1, id2, e1, e2) ->
    "IfFEq(" ^ (string_of_id id1) ^ ", " ^ (string_of_id id2) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.IfFLE(id1, id2, e1, e2) ->
    "IfEq(" ^ (string_of_id id1) ^ ", " ^ (string_of_id id2) ^ ", " ^ (string_of_asm_t e1) ^ ", " ^ (string_of_asm_t e2) ^ ")"
  | Asm.CallCls(name, args1, args2) ->
    "(" ^ (string_of_id name) ^ ", " ^ (string_of_ids args1) ^ ")(" ^ (string_of_ids args2) ^ ")"
  | Asm.CallDir(Id.Label(l), args1, args2) ->
    l ^ "(" ^ (string_of_ids args1) ^ ")(" ^ (string_of_ids args2) ^ ")"
  | Asm.Save(e1, e2) -> "Save(" ^ (string_of_id e1) ^ ", " ^ (string_of_id e2) ^ ")"
  | Asm.Restore(e) -> "Restore(" ^ (string_of_id e) ^ ")"

let string_of_asm_fun e =
  let { Asm.name = Id.Label(l); Asm.args = args; Asm.fargs = fargs; Asm.body = e; Asm.ret = typ } = e in
  l ^ "(" ^ (string_of_ids args) ^ "; " ^ (string_of_ids fargs) ^ ") -> "
  ^ (string_of_type typ) ^ " = " ^ (string_of_asm_t e)

let rec string_of_asm_prog = function
  | Asm.Prog(labels, funs, exp) ->
    "[" ^ (string_of_asm_labels labels) ^ "] {\n" ^ (string_of_asm_funs funs) ^ "}\ntop:\n\t" ^ (string_of_asm_t exp)
and string_of_asm_labels = function
  | [] -> ""
  | (Id.Label(l), d) :: [] -> l ^ "(" ^ (string_of_float d) ^ ")"
  | (Id.Label(l), d) :: xr -> l ^ "(" ^ (string_of_float d) ^ "), " ^ (string_of_asm_labels xr)
and string_of_asm_funs = function
  | [] -> ""
  | f :: fr -> "\t" ^ (string_of_asm_fun f) ^ "\n" ^ (string_of_asm_funs fr) 
