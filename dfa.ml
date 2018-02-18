open KNormal

type t =
  | Entry
  | Exit
  | Block of block_def
and block_def = { in_edge: edge list; out_edge: edge list }
and edge = { in_block: t; out_block: t }


