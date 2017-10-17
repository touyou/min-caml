open KNormal

(* 環境にあるかどうか *)
let memi x env =
  try (match MiniMap.find x env with Int(_) -> true | _ -> false)
  with Not_found -> false
let memf x env =
  try (match MiniMap.find x env with Float(_) -> true | _ -> false)
  with Not_found -> false
let memt x env =
  try (match MiniMap.find x env with Tuple(_) -> true | _ -> false)
  with Not_found -> false

(* 定数を取り出してくる *)
let findi x env = (match MiniMap.find x env with Int(i) -> i | _ -> raise Not_found)
let findui x env = (match MiniMap.find x env with Int(i) -> Type.unsigned_of_int i | _ -> raise Not_found)
let findf x env = (match MiniMap.find x env with Float(d) -> d | _ -> raise Not_found)
let findt x env = (match MiniMap.find x env with Tuple(ys) -> ys | _ -> raise Not_found)

let rec folding env = function
  | Var(x) when memi x env -> Int(findi x env)
  | Var(x) when memf x env -> Float(findf x env)
  | Var(x) when memt x env -> Tuple(findt x env)
  | Neg(x) when memi x env -> Int(-(findi x env))
  | Add(x, y) when memi x env && memi y env -> Int(findi x env + findi y env)
  | Sub(x, y) when memi x env && memi y env -> Int(findi x env - findi y env)
  | Mul(x, y) when memi x env && memi y env -> Int(findi x env * findi y env)
  | Div(x, y) when memi x env && memi y env -> Int(findi x env / findi y env)
  | Xor(x, y) when memi x env && memi y env -> Int(findui x env lxor findui y env)
  | Or(x, y) when memi x env && memi y env -> Int(findui x env lor findui y env)
  | And(x, y) when memi x env && memi y env -> Int(findui x env land findui y env)
  | Sll(x, y) when memi x env && memi y env ->
    Int(let y = findi y env in if y >= 32 then 0 else (findui x env lsl y))
  | Srl(x, y) when memi x env && memi y env ->
    Int(let y = findi y env in if y >= 32 then 0 else (findui x env lsr y))
  | FNeg(x) when memf x env -> Float(-.(findf x env))
  | FAdd(x, y) when memf x env && memf y env -> Float(findf x env +. findf y env)
  | FSub(x, y) when memf x env && memf y env -> Float(findf x env -. findf y env)
  | FMul(x, y) when memf x env && memf y env -> Float(findf x env *. findf y env)
  | FDiv(x, y) when memf x env && memf y env -> Float(findf x env /. findf y env)
  | IfEq(x, y, e1, e2) when memi x env && memi y env ->
    if findi x env = findi y env then folding env e1 else folding env e2
  | IfEq(x, y, e1, e2) when memf x env && memf y env ->
    if findf x env = findf y env then folding env e1 else folding env e2
  | IfEq(x, y, e1, e2) -> IfEq(x, y, folding env e1, folding env e2)
  | IfLE(x, y, e1, e2) when memi x env && memi y env ->
    if findi x env <= findi y env then folding env e1 else folding env e2
  | IfLE(x, y, e1, e2) when memf x env && memf y env ->
    if findf x env <= findf y env then folding env e1 else folding env e2
  | IfLE(x, y, e1, e2) -> IfLE(x, y, folding env e1, folding env e2)
  | Let((x, t), e1, e2) ->
    let e1' = folding env e1 in
    let e2' = folding (MiniMap.add x e1' env) e2 in
    Let((x, t), e1', e2')
  | LetRec({ name = x; args = ys; body = e1 }, e2) ->
    LetRec({ name = x; args = ys; body = folding env e1}, folding env e2)
  | LetTuple(xts, y, e) when memt y env ->
    List.fold_left2
      (fun e' xt z -> Let(xt, Var(z), e'))
      (folding env e)
      xts
      (findt y env)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, folding env e)
  | e -> e

let main = folding MiniMap.empty
