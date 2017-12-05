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

let conv_float f =
  let s = if f >= 0.0 then 0 else 1 in
  let f = abs_float(f) in
  let e, m = if f = 0.0 then 0, 0 else
      let m', e = frexp f in
      let get_man f = int_of_float (ldexp (f -. 0.5) 24) in
      e + 126, get_man m'
  in
  (s lsl 31) + (e lsl 23) + m

let conv_int i =
  if i = 0 then 0.0 else
    let x, _ = frexp (float_of_int ((i land 8388607) lor 8388608)) in
    let f = ldexp (x *. 2.0) (((i lsr 23) land 255) - 127) in
    if (i land 2147483648) = 0 then
      f
    else
      -.f