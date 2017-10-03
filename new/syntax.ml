(* MinCamlの構文を表現  *)
type t =
  | Unit
  | Bool of bool
  | Int of int
  | Float of float
  | Not of t
  | Neg of t
  | Add of t * t
  | Sub of t * t
  | Mul of t * t
  | Div of t * t
  | FNeg of t
  | FAdd of t * t
  | FSub of t * t
  | FMul of t * t
  | FDiv of t * t
  | Eq of t * t
  | LE of t * t
  | If of t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fun_def * t
  | App of t * t list
  | Tuple of t list
  | LetTuple of (Id.t * Type.t) list * t * t
  | Array of t * t
  | Get of t * t
  | Put of t * t * t
and fun_def = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

(* デバッグ用出力 TODO: 必要に応じて出力先をエラー表示に書き換える  *)
let rec log elem =
  match elem with
  | Unit -> print_string "()"
  | Bool e -> if e then print_string "true" else print_string "false"
  | Int e -> print_int e
  | Float e -> print_float e
  | Not e -> print_string "not("; log e; print_string ")"
  | Neg e | FNeg e -> print_string "-("; log e; print_string ")"
  | Add(e1, e2) | FAdd(e1, e2) -> print_string "("; log e1; print_string " + ";
                                    log e2; print_string ")"
  | Sub(e1, e2) | FSub(e1, e2) -> print_string "("; log e1; print_string " - ";
                                    log e2; print_string ")"
  | Mul(e1, e2) | FMul(e1, e2) -> print_string "("; log e1; print_string " * ";
                                    log e2; print_string ")"
  | Div(e1, e2) | FDiv(e1, e2) -> print_string "("; log e1; print_string " / ";
                                    log e2; print_string ")"
  | Eq(e1, e2) -> log e1; print_string " == "; log e2
  | LE(e1, e2) -> log e1; print_string " <= "; log e2
  | If(e1, e2, e3) -> print_string "if "; log e1; print_string " then "; print_newline ();
                       log e2; print_newline ();
                       print_string "else"; print_newline ();
                       log e3
  | Let((id, typ), e1, e2) -> print_string "let "; Id.log id; print_string ": "; Type.log typ;
                               print_string " ="; print_newline ();
                               log e1; print_string " in"; print_newline ();
                               log e2
  | Var id -> Id.log id
  | LetRec ({ name = (id, typ); args = args; body = e1}, e2) ->
          print_string "let rec ("; Id.log id; print_string ": "; Type.log typ; print_string ") ";
          print_string "("; print_args args; print_string ") ="; print_newline ();
          log e1; print_string " in"; print_newline ();
          log e2
  | App(e1, elems) -> log e1; print_string "("; print_elems elems; print_string ")"
  | Tuple elems -> print_string "("; print_elems elems; print_string ")"
  | LetTuple(args, e1, e2) -> print_string "let ("; print_args args; print_string ") ="; print_newline ();
                               log e1; print_string " in"; print_newline ();
                               log e2
  | Array(e1, e2) -> print_string "Array.create "; log e1; print_string " "; log e2
  | Get(e1, e2) -> log e1; print_string ".("; log e2; print_string ")"
  | Put(e1, e2) -> log e1; print_string ".("; log e2; print_string ") <- "; log e3
and print_args args =
  match args with
  | [] -> ()
  | (id, typ) :: [] -> print_string "("; Id.log id; print_string ": "; Type.log typ; print_string ")"
  | (id, typ) :: argr -> print_string "("; Id.log id; print_string ": "; Type.log typ; print_string "), "; print_args argr
and print_elems elems =
  match elems with
  | [] -> ()
  | e :: [] -> log e
  | e :: er -> log e; print_string ", "; print_elems er
