(* 基本型 *)
type t = string
(* ラベル *)
type label = Label of string

(* デバック用出力 TODO: 必要に応じてエラー出力に切り替える *)
let log id = print_string id

let rec pprint_list = function
  | [] -> ""
  | [x] -> x
  | x :: xs -> x ^ " " ^ pprint_list xs

(* 型変数用カウンタ *)
let counter = ref 0

let gen_id s =
  incr counter;
  Printf.sprintf "%s.%d" s !counter

let rec id_of_type = function
  | Type.Unit -> "u"
  | Type.Bool -> "b"
  | Type.Int -> "i"
  | Type.Float -> "d"
  | Type.Fun _ -> "f"
  | Type.Tuple _ -> "t"
  | Type.Array _ -> "a"
  | Type.Var _ -> assert false

let gen_tmp typ =
  incr counter;
  Printf.sprintf "T%s%d" (id_of_type typ) !counter

