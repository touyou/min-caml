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

let unsigned_of_int i =
  if i < 0 then i + 4294967296
  else i
