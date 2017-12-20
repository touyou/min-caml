open KNormal

let find x env = try MiniMap.find x env with Not_found -> x

let rec alpha_conv env = function
  | Unit -> Unit
  | Int(i) -> Int(i)
  | Float(d) -> Float(d)
  | Neg(x) -> Neg(find x env)
  | Add(x, y) -> Add(find x env, find y env)
  | Sub(x, y) -> Sub(find x env, find y env)
  | Mul(x, y) -> Mul(find x env, find y env)
  | Div(x, y) -> Div(find x env, find y env)
  | Xor(x, y) -> Xor(find x env, find y env)
  | Or(x, y) -> Or(find x env, find y env)
  | And(x, y) -> And(find x env, find y env)
  | Sll(x, y) -> Sll(find x env, find y env)
  | Srl(x, y) -> Srl(find x env, find y env)
  | FNeg(x) -> FNeg(find x env)
  | FAdd(x, y) -> FAdd(find x env, find y env)
  | FSub(x, y) -> FSub(find x env, find y env)
  | FMul(x, y) -> FMul(find x env, find y env)
  | FDiv(x, y) -> FDiv(find x env, find y env)
  | IfEq(x, y, e1, e2) -> IfEq(find x env, find y env, alpha_conv env e1, alpha_conv env e2)
  | IfLE(x, y, e1, e2) -> IfLE(find x env, find y env, alpha_conv env e1, alpha_conv env e2)
  | Let((x, t), e1, e2) ->
    let x' = Id.gen_id x in
    Let((x', t), alpha_conv env e1, alpha_conv (MiniMap.add x x' env) e2)
  | Var(x) -> Var(find x env)
  | LetRec({ name = (x, t); args = yts; body = e1}, e2) ->
    let env = MiniMap.add x (Id.gen_id x) env in
    let ys = List.map fst yts in
    let env' = MiniMap.add_list2 ys (List.map Id.gen_id ys) env in
    LetRec({ name = (find x env, t);
             args = List.map (fun (y, t) -> (find y env', t)) yts;
             body = alpha_conv env' e1 },
           alpha_conv env e2)
  | App(x, ys) -> App(find x env, List.map (fun y -> find y env) ys)
  | Tuple(xs) -> Tuple(List.map (fun x -> find x env) xs)
  | LetTuple(xts, y, e) ->
    let xs = List.map fst xts in
    let env' = MiniMap.add_list2 xs (List.map Id.gen_id xs) env in
    LetTuple(List.map (fun (x, t) -> (find x env', t)) xts,
             find y env,
             alpha_conv env' e)
  | I2F(x) -> I2F(find x env)
  | F2I(x) -> F2I(find x env)
  | In(x) -> In(find x env)
  | Out(x) -> Out(find x env)
  | Get(x, y) -> Get(find x env, find y env)
  | Put(x, y, z) -> Put(find x env, find y env, find z env)
  | ExtVar(x, t) -> ExtVar(x, t)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(x, ys) -> ExtFunApp(x, List.map (fun y -> find y env) ys)

let main = alpha_conv MiniMap.empty
