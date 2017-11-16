open Syntax
let gen_fun = Id.gen_id "fun"
let add_type x = (x, Type.gen_type ())

(*
envには関数定義を入れる。もし引数の個数が足りなかったら補完したlet recに置換する
LetRecDefに相当する関数も扱うために、グローバルに宣言された関数に関してはgenvに入れておく
Appの部分でそこから探し出して引数の個数をみてあげる
*)

let genv = ref MiniMap.empty
let gtenv = ref MiniMap.empty

let rec ntail n arr =
  if n = 0 then arr
  else ntail (n-1) (List.tl arr)

let rec eta_conv env tenv = function
  | Unit -> Unit
  | Bool(b) -> Bool(b)
  | Int(i) -> Int(i)
  | Float(f) -> Float(f)
  | Not(e) -> Not(eta_conv env tenv e)
  | Neg(e) -> Neg(eta_conv env tenv e)
  | Add(e1, e2) -> Add(eta_conv env tenv e1, eta_conv env tenv e2)
  | Sub(e1, e2) -> Sub(eta_conv env tenv e1, eta_conv env tenv e2)
  | Mul(e1, e2) -> Mul(eta_conv env tenv e1, eta_conv env tenv e2)
  | Div(e1, e2) -> Div(eta_conv env tenv e1, eta_conv env tenv e2)
  | Xor(e1, e2) -> Xor(eta_conv env tenv e1, eta_conv env tenv e2)
  | Or(e1, e2) -> Or(eta_conv env tenv e1, eta_conv env tenv e2)
  | And(e1, e2) -> And(eta_conv env tenv e1, eta_conv env tenv e2)
  | Sll(e1, e2) -> Sll(eta_conv env tenv e1, eta_conv env tenv e2)
  | Srl(e1, e2) -> Srl(eta_conv env tenv e1, eta_conv env tenv e2)
  | FNeg(e) -> FNeg(eta_conv env tenv e)
  | FAdd(e1, e2) -> FAdd(eta_conv env tenv e1, eta_conv env tenv e2)
  | FSub(e1, e2) -> FSub(eta_conv env tenv e1, eta_conv env tenv e2)
  | FMul(e1, e2) -> FMul(eta_conv env tenv e1, eta_conv env tenv e2)
  | FDiv(e1, e2) -> FDiv(eta_conv env tenv e1, eta_conv env tenv e2)
  | Eq(e1, e2) -> Eq(eta_conv env tenv e1, eta_conv env tenv e2)
  | LE(e1, e2) -> LE(eta_conv env tenv e1, eta_conv env tenv e2)
  | If(e1, e2, e3) -> If(eta_conv env tenv e1, eta_conv env tenv e2, eta_conv env tenv e3)
  | Let(xs, e1, e2) -> Let(xs, eta_conv env tenv e1, eta_conv env tenv e2)
  | LetDef(xs, e) -> LetDef(xs, eta_conv env tenv e)
  | LetRec({ name = (x, t); args = yts; body = e1}, e2) ->
    let env' = MiniMap.add x yts env in
    let tenv' = MiniMap.add x t tenv in
    LetRec({ name = (x, t); args = yts; body = eta_conv env tenv e1}, eta_conv env' tenv' e2)
  | LetRecDef({ name = (x, t); args = yts; body = e}) ->
    genv := MiniMap.add x yts !genv;
    gtenv := MiniMap.add x t !gtenv;
    LetRecDef({ name = (x, t); args = yts; body = eta_conv env tenv e})
  | Var(x) -> Var(x)
  | App(Var(x), es) when MiniMap.mem x env ->
    let yts = MiniMap.find x env in
    let Type.Fun(ts, _) = MiniMap.find x tenv in
    (* 実際の引数よりも多い場合は型エラーをおこすからとりあえずここではスルー *)
    if (List.length ts) <= (List.length es) then App(Var(x), (List.map (eta_conv env tenv) es))
    else
      let name = gen_fun in
      let (_, typ) = add_type name in
      let nts = ntail (List.length es) yts in
      LetRec({ name = (name, typ); args = nts; body = App(Var(x), (List.map (eta_conv env tenv) es) @ (List.map (fun (x, _) -> Var(x)) nts))}, Var(name))
  | App(Var(x), es) when MiniMap.mem x !genv ->
    let yts = MiniMap.find x !genv in
    let Type.Fun(ts, _) = MiniMap.find x !gtenv in
    if (List.length ts) <= (List.length es) then App(Var(x), (List.map (eta_conv env tenv) es))
    else
      let name = gen_fun in
      let (_, typ) = add_type name in
      let nts = ntail (List.length es) yts in
      LetRec({ name = (name, typ); args = nts; body = App(Var(x), (List.map (eta_conv env tenv) es) @ (List.map (fun (x, _) -> Var(x)) nts))}, Var(name))
  | App(e, es) -> App(eta_conv env tenv e, (List.map (eta_conv env tenv) es))
  | Tuple(es) -> Tuple(List.map (eta_conv env tenv) es)
  | LetTuple(xts, e1, e2) -> LetTuple(xts, eta_conv env tenv e1, eta_conv env tenv e2)
  | Array(e1, e2) -> Array(eta_conv env tenv e1, eta_conv env tenv e2)
  | In(e) -> In(eta_conv env tenv e)
  | Out(e) -> Out(eta_conv env tenv e)
  | Get(e1, e2) -> Get(eta_conv env tenv e1, eta_conv env tenv e2)
  | Put(e1, e2, e3) -> Put(eta_conv env tenv e1, eta_conv env tenv e2, eta_conv env tenv e3)

let main = eta_conv MiniMap.empty MiniMap.empty
