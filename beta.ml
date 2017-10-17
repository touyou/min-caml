open KNormal

let find x env = try MiniMap.find x env with Not_found -> x

let rec beta_cond env = function
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
  | IfEq(x, y, e1, e2) -> IfEq(find x env, find y env, beta_cond env e1, beta_cond env e2)
  | IfLE(x, y, e1, e2) -> IfLE(find x env, find y env, beta_cond env e1, beta_cond env e2)
  | Let((x, t), e1, e2) ->
    (match beta_cond env e1 with
     | Var(y) ->
       Format.eprintf "beta-reducing %s = %s@." x y;
       beta_cond (MiniMap.add x y env) e2
     | e1' ->
       let e2' = beta_cond env e2 in
       Let((x, t), e1', e2'))
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
    LetRec({ name = xt; args = yts; body = beta_cond env e1 }, beta_cond env e2)
  | Var(x) -> Var(find x env)
  | Tuple(xs) -> Tuple(List.map (fun x -> find x env) xs)
  | LetTuple(xts, y, e) -> LetTuple(xts, find y env, beta_cond env e)
  | In(x) -> In(find x env)
  | Out(x) -> Out(find x env)
  | Get(x, y) -> Get(find x env, find y env)
  | Put(x, y, z) -> Put(find x env, find y env, find z env)
  | App(g, xs) -> App(find g env, List.map (fun x -> find x env) xs)
  | ExtVar(x, t) -> ExtVar(x, t)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(x, ys) -> ExtFunApp(x, ListLabels.map (fun x -> find x env) ys)

let main = beta_cond MiniMap.empty
