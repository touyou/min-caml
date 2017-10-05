open KNormal

(* ネストしたletの簡約 *)
let rec main = function
  | IfEq(x, y, e1, e2) -> IfEq(x, y, main e1, main e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, main e1, main e2)
  | Let(xt, e1, e2) ->
    let rec insert = function
      | Let(yt, e3, e4) -> Let(yt, e3, insert e4)
      | LetRec(fundefs, e) -> LetRec(fundefs, insert e)
      | LetTuple(yts, z, e) -> LetTuple(yts, z, insert e)
      | e -> Let(xt, e, main e2) in
    insert (main e1)
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
    LetRec({ name = xt; args = yts; body = main e1}, main e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, main e)
  | e -> e