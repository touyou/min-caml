type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

(* デバッグ用出力*)
let rec log typ =
  match typ with
  | Unit -> print_string "Unit"
  | Bool -> print_string "Bool"
  | Int -> print_string "Float"
  | Fun (t1, t2) -> log (Tuple t1); print_string " -> "; log t2
  | Tuple t -> print_string "("; list_log t; print_string ")"
  | Array t -> print_string "["; log t; print_string "]"
  | Var t ->
      let var = !t in
      (match var with
      | Some t -> log t
      | None -> print_string "a")
and list_log typ_arr =
  match typ_arr with
  | [] -> ()
  | t :: [] -> log t
  | t :: tr -> log t; print_string ", "; list_log tr

let gentyp () = Var(ref None) (* 新しい型変数を作る *)
