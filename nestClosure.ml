let rec nest_closured_form env tenv = function
  | Closure.Tuple(xs) ->
    (* nestを外す処理をする *)
    Closure.NTuple(flat_nest env tenv xs, Type.Tuple(closure_type tenv xs))
  | Closure.IfEq(x, y, e1, e2) ->
    Closure.IfEq(x, y, nest_closured_form env tenv e1, nest_closured_form env tenv e2)
  | Closure.IfLE(x, y, e1, e2) ->
    Closure.IfLE(x, y, nest_closured_form env tenv e1, nest_closured_form env tenv e2)
  | Closure.Let((x, t), e1, e2) ->
    let env' = MiniMap.add x e1 env in
    let tenv' = MiniMap.add x t tenv in
    Closure.Let((x, t), nest_closured_form env tenv e1, nest_closured_form env' tenv' e2)
  | Closure.MakeCls((x, t), { entry = l; actual_free_var = ys }, e) ->
    let tenv' = MiniMap.add x t tenv in
    Closure.MakeCls((x, t), { entry = l; actual_free_var = ys }, nest_closured_form env tenv' e)
  | Closure.LetTuple(xts, x, e) ->
    let tenv' = MiniMap.add_list xts tenv in
    Closure.LetTuple(xts, x, nest_closured_form env tenv' e)
  | exp -> exp
and flat_nest env tenv = function
  | [] -> []
  | x :: xs ->
    (match MiniMap.find x tenv with
     | Type.Tuple(ts) ->
       let Closure.Tuple(xs') = MiniMap.find x env in
       (flat_nest env tenv xs') @ (flat_nest env tenv xs)
     | t -> x :: (flat_nest env tenv xs))
and closure_type tenv = function
  | [] -> []
  | x :: xs -> (MiniMap.find x tenv) :: (closure_type tenv xs)
