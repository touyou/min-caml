type t = (* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
  | Unit
  | Bool of bool
  | Int of int
  | Float of float
  | Not of t
  | Neg of t
  | Add of t * t
  | Sub of t * t
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
  | LetRec of fundef * t
  | App of t * t list
  | Tuple of t list
  | LetTuple of (Id.t * Type.t) list * t * t
  | Array of t * t
  | Get of t * t
  | Put of t * t * t
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

(* デバッグ用出力 *)
let rec log e =
  match e with
  | Unit -> print_string "()"
  | Bool b -> if b then print_string "true" else print_string "false"
  | Int i -> print_int i
  | Float f -> print_float f
  | Not e1 -> print_string "not("; log e1; print_string ")"
  | Neg e1 | FNeg e1 -> print_string "-("; log e1; print_string ")"
  | Add (e1, e2) | FAdd (e1, e2) -> print_string "("; log e1; print_string " + "; log e2; print_string ")"
  | Sub (e1, e2) | FSub (e1, e2) -> print_string "("; log e1; print_string " - "; log e2; print_string ")"
  | FMul (e1, e2) -> print_string "("; log e1; print_string " * "; log e2; print_string ")"
  | FDiv (e1, e2) -> print_string "("; log e1; print_string " / "; log e2; print_string ")"
  | Eq (e1, e2) -> log e1; print_string " == "; log e2
  | LE (e1, e2) -> log e1; print_string " <= "; log e2
  | If (e1, e2, e3) -> print_string "if "; log e1; print_string " then "; log e2; print_string " else "; log e3; print_newline ()
  | Let ((id, typ), e1, e2) -> print_string "let "; Id.log id; print_string ": "; Type.log typ; print_string " = "; log e1; print_string " in "; log e2
  | Var id -> Id.log id
  | LetRec ({ name = (id, typ); args = args; body = e1}, e2) -> print_string "let rec ("; Id.log id; print_string ": "; Type.log typ; print_string ") ("; print_args args; print_string ") = "; print_newline (); log e1; print_string " in "; log e2
  | App (e1, elist) -> log e1; print_string "("; print_elist elist; print_string ")"
  | Tuple elist -> print_string "("; print_elist elist; print_string ")"
  | LetTuple (args, e1, e2) -> print_string "let ("; print_args args; print_string ") = "; log e1; print_string " in "; log e2
  | Array (e1, e2) -> print_string "Array.create "; log e1; print_string " "; log e2
  | Get (e1, e2) -> log e1; print_string ".("; log e2; print_string ")"
  | Put (e1, e2, e3) -> log e1; print_string ".("; log e2; print_string ") <- "; log e3
and print_args args =
  match args with
  | [] -> ()
  | (id, typ) :: [] -> print_string "("; Id.log id; print_string ": "; Type.log typ; print_string ")"
  | (id, typ) :: tr -> print_string "("; Id.log id; print_string ": "; Type.log typ; print_string "), "; print_args tr
and print_elist elist =
  match elist with
  | [] -> ()
  | t :: [] -> log t
  | t :: tr -> log t; print_string ", "; print_elist tr

