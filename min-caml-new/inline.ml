open KNormal

(* インライン展開する関数の最大サイズ *)
let threshold = ref 0

let rec size = function
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2)
  | Let(_, e1, e2) | LetRec({ body = e1 }, e2) -> 1 + size e1 + size e2
  | LetTuple(_, _, e) -> 1 + size e
  | _ -> 1

let rec inlined env = function
  | IfEq(x, y, e1, e2) -> IfEq(x, y, inlined env e1, inlined env e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, inlined env e1, inlined env e2)
  | Let(xt, e1, e2) -> Let(xt, inlined env e1, inlined env e2)
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
    let env = if size e1 > !threshold then env else MiniMap.add x (yts, e1) env in
    LetRec({ name = (x, t); args = yts; body = inlined env e1}, inlined env e2)
  | App(x, ys) when MiniMap.mem x env ->
    let (zs, e) = MiniMap.find x env in
    Format.eprintf "inlining %s@." x;
    let env' =
      List.fold_left2
        (fun env' (z, t) y -> MiniMap.add z y env')
        MiniMap.empty
        zs
        ys in
    Alpha.alpha_conv env' e
  | LetTuple(xts, y, e) -> LetTuple(xts, y, inlined env e)
  | e -> e

let main e = inlined MiniMap.empty e