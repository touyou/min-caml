(* カスタムしたSet *)

module MiniSet =
  Set.Make
    (struct
      type t = Id.t
      let compare = compare
    end)
include MiniSet

let of_list l = List.fold_left (fun s e -> add e s) empty l
