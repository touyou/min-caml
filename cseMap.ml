(*
共通部分式検索用のマップ
式をDebugの関数を使ってstringに直し、それを比較することでMapのKeyとして使えるようにする
*)

module CseMap =
  Map.Make
    (struct
      type t = KNormal.t
      let compare x y =
        let x_str = Debug.string_of_knormal x in
        let y_str = Debug.string_of_knormal y in
        String.compare x_str y_str
    end)
include CseMap
