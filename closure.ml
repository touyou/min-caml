type closure = { entry : Id.label; actual_free_var : Id.t list }
type t =
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | Mul of Id.t * Id.t
  | Div of Id.t * Id.t
  | Xor of Id.t * Id.t
  | Or of Id.t * Id.t
  | And of Id.t * Id.t
  | Sll of Id.t * Id.t
  | Srl of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t
  | IfLE of Id.t * Id.t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | MakeCls of (Id.t * Type.t) * closure * t
  | AppCls of Id.t * Id.t list
  | AppDir of Id.label * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | In
  | Out of Id.t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtVar of Id.label * Type.t
  | ExtArray of Id.label
type fun_def = { name : Id.label * Type.t;
                 args : (Id.t * Type.t) list;
                 formal_free_var : (Id.t * Type.t) list;
                 body : t }
type prog = Prog of fun_def list * t

let rec free_var = function
  | Unit | Int(_) | Float(_) | ExtVar(_) | ExtArray(_) | In -> MiniSet.empty
  | Neg(x) | FNeg(x) | Out(x) -> MiniSet.singleton x
  | Add(x, y) | Sub(x, y) | Mul(x, y) | Div(x, y)
  | Xor(x, y) | Or(x, y) | And(x, y) | Sll(x, y) | Srl(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> MiniSet.of_list [x; y]
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) -> MiniSet.add x (MiniSet.add y (MiniSet.union (free_var e1) (free_var e2)))
  | Let((x, t), e1, e2) -> MiniSet.union (free_var e1) (MiniSet.remove x (free_var e2))
  | Var(x) -> MiniSet.singleton x
  | MakeCls((x, t), { entry = l; actual_free_var = ys }, e) -> MiniSet.remove x (MiniSet.union (MiniSet.of_list ys) (free_var e))
  | AppCls(x, ys) -> MiniSet.of_list (x :: ys)
  | AppDir(_, xs) | Tuple(xs) -> MiniSet.of_list xs
  | LetTuple(xts, y, e) -> MiniSet.add y (MiniSet.diff (free_var e) (MiniSet.of_list (List.map fst xts)))
  | Put(x, y, z) -> MiniSet.of_list [x; y; z]

let toplevel : fun_def list ref = ref []

let rec closure_conv env known = function
  | KNormal.Unit -> Unit
  | KNormal.Int(i) -> Int(i)
  | KNormal.Float(d) -> Float(d)
  | KNormal.Neg(x) -> Neg(x)
  | KNormal.Add(x, y) -> Add(x, y)
  | KNormal.Sub(x, y) -> Sub(x, y)
  | KNormal.Mul(x, y) -> Mul(x, y)
  | KNormal.Div(x, y) -> Div(x, y)
  | KNormal.Xor(x, y) -> Xor(x, y)
  | KNormal.Or(x, y) -> Or(x, y)
  | KNormal.And(x, y) -> And(x, y)
  | KNormal.Sll(x, y) -> Sll(x, y)
  | KNormal.Srl(x, y) -> Srl(x, y)
  | KNormal.FNeg(x) -> FNeg(x)
  | KNormal.FAdd(x, y) -> FAdd(x, y)
  | KNormal.FSub(x, y) -> FSub(x, y)
  | KNormal.FMul(x, y) -> FMul(x, y)
  | KNormal.FDiv(x, y) -> FDiv(x, y)
  | KNormal.IfEq(x, y, e1, e2) -> IfEq(x, y, closure_conv env known e1, closure_conv env known e2)
  | KNormal.IfLE(x, y, e1, e2) -> IfLE(x, y, closure_conv env known e1, closure_conv env known e2)
  | KNormal.Let((x, t), e1, e2) -> Let((x, t), closure_conv env known e1, closure_conv (MiniMap.add x t env) known e2)
  | KNormal.Var(x) -> Var(x)
  | KNormal.LetRec({ KNormal.name = (x, t); KNormal.args = yts; KNormal.body = e1 }, e2) ->
    (* 関数定義で関数に自由変数がないと仮定しknownに追加してe1をクロージャ変換してみる  *)
    let toplevel_backup = !toplevel in
    let env' = MiniMap.add x t env in
    let known' = MiniSet.add x known in
    let e1' = closure_conv (MiniMap.add_list yts env') known' e1 in
    (* 本当に自由変数がなかったか、変換結果e1'を確認。e1'にx自信が出現するならclosureへ *)
    let zs = MiniSet.diff (free_var e1') (MiniSet.of_list (List.map fst yts)) in
    let known', e1' =
      if MiniSet.is_empty zs then
        known', e1'
      else
      (* ダメなら状態を戻してやり直し *)
      (Format.eprintf "free variable(s) %s found in function %s@." (Id.pprint_list (MiniSet.elements zs)) x;
       Format.eprintf "function %s cannot be directly applied in fact@." x;
       toplevel := toplevel_backup;
       let e1' = closure_conv (MiniMap.add_list yts env') known e1 in
       known, e1') in
      (* 自由変数のリスト *)
      let zs = MiniSet.elements (MiniSet.diff (free_var e1') (MiniSet.add x (MiniSet.of_list (List.map fst yts)))) in
      (* 自由変数zの型を引くために引数envが必要 *)
      let zts = List.map (fun z -> (z, MiniMap.find z env')) zs in
      toplevel := { name = (Id.Label(x), t); args = yts; formal_free_var = zts; body = e1' } :: !toplevel;
      let e2' = closure_conv env' known' e2 in
      (* xが変数としてe2'に出現するか *)
      if MiniSet.mem x (free_var e2') then
        MakeCls((x, t), { entry = Id.Label(x); actual_free_var = zs }, e2')
      else
        (Format.eprintf "eliminating closure(s) %s@." x;
        e2')
  | KNormal.App(x, ys) when MiniSet.mem x known ->
      Format.eprintf "directly applying %s@." x;
      AppDir(Id.Label(x), ys)
  | KNormal.App(f, xs) -> AppCls(f, xs)
  | KNormal.Tuple(xs) -> Tuple(xs)
  | KNormal.LetTuple(xts, y, e) -> LetTuple(xts, y, closure_conv (MiniMap.add_list xts env) known e)
  | KNormal.In(x) -> In
  | KNormal.Out(x) -> Out(x)
  | KNormal.Get(x, y) -> Get(x, y)
  | KNormal.Put(x, y, z) -> Put(x, y, z)
  | KNormal.ExtVar(x, t) -> ExtVar(Id.Label(x), t)
  | KNormal.ExtArray(x) -> ExtArray(Id.Label(x))
  | KNormal.ExtFunApp(x, ys) -> AppDir(Id.Label("min_caml_" ^ x), ys)

let main e =
  toplevel := [];
  let e' = closure_conv MiniMap.empty MiniSet.empty e in
  Prog(List.rev !toplevel, e')
