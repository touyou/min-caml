open KNormal

(*
適切にα変換されており、同じ識別子であれば必ず同じ値を指しているという前提のもと
letについてのみ考えていく。
今回は簡易に副作用のある場合は考慮せずに副作用の無い式に対してカスタムMapを利用してCSEを行う
*)

let rec not_effect = function
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) -> not_effect e1 && not_effect e2
  | LetRec(_, e) | LetTuple(_, _, e) -> not_effect e
  | In(_) | Out(_) | App(_) | Get(_) | Put(_) | ExtArray(_) | ExtFunApp(_) -> false
  | _ -> true

(* TODO: let recを超えて共通部分式削除するとむしろ悪化するらしい  *)

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
       (* 副作用がある場合は削除リストに加えない *)
       if not_effect e1' then
         let env' = CseMap.add e1' id env in
         Let((id, typ), e1', cse env' e2)
       else
         Let((id, typ), e1', cse env e2)
     | LetRec({ name = (id, typ); args = args; body = e1 }, e2) ->
       LetRec({ name = (id, typ); args = args; body = cse env e1 }, cse env e2)
     | LetTuple(xts, id, e) -> LetTuple(xts, id, cse env e)
     | t -> t)

let main = cse CseMap.empty
