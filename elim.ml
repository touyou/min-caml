open KNormal

let rec has_effect = function
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) -> has_effect e1 || has_effect e2
  | LetRec(_, e) | LetTuple(_, _, e) -> has_effect e
  | In(_) | Out(_) |App(_) | Put(_) | ExtFunApp(_) -> true
  | _ -> false

let rec main = function
  | IfEq(x, y, e1, e2) -> IfEq(x, y, main e1, main e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, main e1, main e2)
  | Let((x, t), e1, e2) ->
    let e1' = main e1 in
    let e2' = main e2 in
    if has_effect e1' || MiniSet.mem x (free_var e2') then Let((x, t), e1', e2')
    else (Format.eprintf "eliminating variable %s@." x; e2')
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
    let e2' = main e2 in
    if MiniSet.mem x (free_var e2) then
      LetRec({ name = (x, t); args = yts; body = main e1 }, e2')
    else
      (Format.eprintf "eliminating function %s@." x; e2')
  | LetTuple(xts, y, e) ->
    let xs = List.map fst xts in
    let e' = main e in
    let live = free_var e' in
    if List.exists (fun x -> MiniSet.mem x live) xs then LetTuple(xts, y, e')
    else (Format.eprintf "eliminating variables %s@." (Id.pprint_list xs); e')
  | e -> e
