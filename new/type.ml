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

(* デバック用出力 TODO: エラー出力に必要に応じて切り替える *)
let rec log typ =
  match typ with
  | Unit -> print_string "Unit"
  | Bool -> print_string "Bool"
  | Int -> print_string "Int"
  | Float -> print_string "Float"
  | Fun(t1, t2) -> log (Tuple t1); print_string " -> "; log t2
  | Tuple(ts) -> print_string "("; print_list ts; print_string ")"
  | Array(t) -> print_string "["; log t; print_string "]"
  | Var(t) ->
      let var = !t in
      (match var with
      | Some t -> log t
      | None -> print_string "T")
and print_list ts =
  match ts with
  | [] -> ()
  | t :: [] -> log t
  | t :: tr -> log t; print_string ", "; print_list tr

(* 新しい型変数を作る *)
let gen_type () = Var(ref None)
