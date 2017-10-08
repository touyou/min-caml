(* データ型 *)
type t =
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t
  | Tuple of t list
  | Array of t
  | Var of t option ref

(* 新しい型変数を作る *)
let gen_type () = Var(ref None)
