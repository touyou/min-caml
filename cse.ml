open KNormal

(*
適切にα変換されており、同じ識別子であれば必ず同じ値を指しているという前提のもと
letについてのみ考えていく。
今回は簡易に副作用のある場合は考慮せずに副作用の無い式に対してカスタムMapを利用してCSEを行う


let rec not_effect = function
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) -> not_effect e1 && not_effect e2
  | LetRec(_, e) | LetTuple(_, _, e) -> not_effect e
  | In(_) | Out(_) | App(_) | Get(_) | Put(_) | ExtArray(_) | ExtFunApp(_) -> false
  | _ -> true

 TODO: let recを超えて共通部分式削除するとむしろ悪化するらしい  *)

(*let rec cse env e =
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
     | t -> t)*)

(* 環境を使って式を評価する方式に変更。  *)

let rec is_common_exp env1 e1 env2 e2 =
  match e1, e2 with
  | Unit, Unit -> true
  | Int(i), Int(j) -> i = j
  | Float(f), Float(g) -> f = g
  | Neg(id1), Neg(id2) | FNeg(id1), FNeg(id2) -> is_same_id env1 id1 env2 id2
  | Add(x1, y1), Add(x2, y2) | Sub(x1, y1), Sub(x2, y2)
  | Mul(x1, y1), Mul(x2, y2) | Div(x1, y1), Div(x2, y2)
  | Xor(x1, y1), Xor(x2, y2) | Or(x1, y1), Or(x2, y2)
  | And(x1, y1), And(x2, y2) | Sll(x1, y1), Sll(x2, y2)
  | Srl(x1, y1), Srl(x2, y2) | FAdd(x1, y1), FAdd(x2, y2)
  | FSub(x1, y1), FSub(x2, y2) | FMul(x1, y1), FMul(x2, y2)
  | FDiv(x1, y1), FDiv(x2, y2) -> (is_same_id env1 x1 env2 y2) && (is_same_id env1 x1 env2 y2)
  | IfEq(x1, y1, e11, e12), IfEq(x2, y2, e21, e22)
  | IfLE(x1, y1, e11, e12), IfLE(x2, y2, e21, e22) ->
    (is_same_id env1 x1 env2 x2) && (is_same_id env1 y1 env2 y2)
    && (is_common_exp env1 e11 env2 e21) && (is_common_exp env1 e12 env2 e22)
  | Let((x1, t1), e11, e12), Let((x2, t2), e21, e22) ->
    if t1 = t2 && is_common_exp env1 e11 env2 e21 then
      let env1' = MiniMap.add x1 e11 env1 in
      let env2' = MiniMap.add x2 e21 env2 in
      is_common_exp env1' e12 env2' e21
    else false
  | Var(x1), Var(x2) -> x1 = x2
  | LetRec({ name = (x1, t1); args = ys1; body = e11}, e12),
    LetRec({ name = (x2, t2); args = ys2; body = e21}, e22) ->
    if t1 = t2 && (List.map snd ys1) = (List.map snd ys2) then
      let env1' = MiniMap.add_list (List.map (fun (y, _) -> (y, Var(y))) ys1) env1 in
      let env2' = MiniMap.add_list (List.map (fun (y, _) -> (y, Var(y))) ys2) env2 in
      (is_common_exp env1' e11 env2' e21) && (is_common_exp (MiniMap.add x1 e11 env1) e12 (MiniMap.add x2 e21 env2) e22)
    else false
  | App(x1, ys1), App(x2, ys2) -> (is_same_id env1 x1 env2 x2) && (is_same_ids env1 ys1 env2 ys2)
  | Tuple(xs1), Tuple(xs2) -> is_same_ids env1 xs1 env2 xs2
  | LetTuple(xs1, x1, e1), LetTuple(xs2, x2, e2) ->
    (is_same_ids env1 (List.map fst xs1) env2 (List.map fst xs2)) && (is_same_id env1 x1 env2 x2) && (is_common_exp env1 e1 env2 e2)
  | I2F(x1), I2F(x2) | F2I(x1), F2I(x2) | Out(x1), Out(x2) -> is_same_id env1 x1 env2 x2
  | Get(x1, y1), Get(x2, y2) -> (is_same_id env1 x1 env2 y2) && (is_same_id env1 x1 env2 y2)
  | Put(x1, y1, z1), Put(x2, y2, z2) ->
    (is_same_id env1 x1 env2 x2) && (is_same_id env1 y1 env2 y2) && (is_same_id env1 z1 env2 z2)
  | ExtVar(x1, t1), ExtVar(x2, t2) ->
    t1 = t2 && (is_same_id env1 x1 env2 x2)
  | ExtArray(x1), ExtArray(x2) -> is_same_id env1 x1 env2 x2
  | _, _ -> false
and is_same_id env1 id1 env2 id2 =
  if id1 = id2 then true
  else
    (try
       let e1 = MiniMap.find id1 env1 in
       let e2 = MiniMap.find id2 env2 in
       is_common_exp env1 e1 env2 e2
     with Not_found -> false)
and is_same_ids env1 ids1 env2 ids2 =
  if List.length ids1 != List.length ids2 then false
  else List.fold_left (&&) true (List.map2 (fun id1 id2 -> is_same_id env1 id1 env2 id2) ids1 ids2)

let rec find_exp e env =
  let id, exp = MiniMap.choose env in
  let env' = MiniMap.remove id env in
  if is_common_exp env e env exp then
    id
  else
    find_exp e env'

let rec cse env = function
  | IfEq(id1, id2, e1, e2) -> IfEq(id1, id2, cse env e1, cse env e2)
  | IfLE(id1, id2, e1, e2) -> IfLE(id1, id2, cse env e1, cse env e2)
  | Let((id, typ), e1, e2) -> 
    (match e1 with
     | Int(_) | Float(_) -> Let((id, typ), e1, cse env e2)
     | _ ->
       (try
          let id' = find_exp e1 env in
          let e' = if id' != id then Var(id') else e1 in
          let env' = MiniMap.add id e' env in
          Format.eprintf "common subexp eliminating in %s, %s@." id id';
          Let((id, typ), cse env e1, cse env' e2)
        with Not_found ->
          let env' = MiniMap.add id e1 env in
          Let((id, typ), cse env e1, cse env' e2)))
  | LetRec({ name = xt; args = ys; body = e1}, e2) ->
    LetRec({ name = xt; args = ys; body = cse env e1}, cse env e2)
  | LetTuple(xts, x, e) -> LetTuple(xts, x, cse env e)
  | t -> t

let main = cse MiniMap.empty
