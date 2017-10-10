open KNormal

(*
適切にα変換されており、同じ識別子であれば必ず同じ値を指しているという前提のもと
letについてのみ考えていく。
*)

let rec cse env e =
  try
    let id = CseMap.find e env in
    (* 見つかった場合そのidで置き換える。 *)
    Var(id)
  with Not_found ->
    (match e with
    | IfEq(id1, id2, e1, e2) -> IfEq(id1, id2, cse env e1, cse env e2)
    | IfLE(id1, id2, e1, e2) -> IfLE(id1, id2, cse env e1, cse env e2)
    | Let((id, typ), e1, e2) ->
      let e1' = cse env e1 in
      let env' = CseMap.add e1' id env in
      Let((id, typ), e1', cse env' e2)
    | LetRec({ name = (id, typ); args = args; body = e1 }, e2) ->
      LetRec({ name = (id, typ); args = args; body = cse env e1 }, cse env e2)
    | LetTuple(xts, id, e) -> LetTuple(xts, id, cse env e)
    | t -> t)

let main = cse CseMap.empty
