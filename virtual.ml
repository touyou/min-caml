open Asm

(* 浮動小数点の定数テーブル *)
let data = ref []

let classify xts ini addf addi =
  List.fold_left
    (fun acc (x, t) ->
       match t with
       | Type.Unit -> acc
       | Type.Float -> addf acc x
       | _ -> addi acc x t)
    ini
    xts

let separate xts =
  classify
    xts
    ([], [])
    (fun (int, float) x -> (int, float @ [x]))
    (fun (int, float) x _ -> (int @ [x], float))

let expand xts ini addf addi =
  classify
    xts
    ini
    (fun (offset, acc) x ->
       let offset = align offset in
       (offset + 8, addf x offset acc))
    (fun (offset, acc) x t ->
       (offset + 4, addi x t offset acc))

(* 仮想マシンコードに変換：式 *)
let rec virtualize_form env = function
  | Closure.Unit -> Ans(Nop)
  | Closure.Int(i) -> Ans(Li(i))
  | Closure.Float(d) ->
    let l =
      try
        let (l, _) = List.find (fun (_, d') -> d = d') !data in
        l
      with Not_found ->
        let l = Id.Label(Id.gen_id "l") in
        data := (l, d) :: !data;
        l in
    Ans(FLi(l))
  | Closure.Neg(x) -> Ans(Neg(x))
  | Closure.Add(x, y) -> Ans(Add(x, Var(y)))
  | Closure.Sub(x, y) -> Ans(Sub(x, Var(y)))
  | Closure.Mul(x, y) -> Ans(Mul(x, Var(y)))
  | Closure.Div(x, y) -> Ans(Div(x, Var(y)))
  | Closure.Xor(x, y) -> Ans(Xor(x, Var(y)))
  | Closure.Or(x, y) -> Ans(Or(x, Var(y)))
  | Closure.And(x, y) -> Ans(And(x, Var(y)))
  | Closure.Sll(x, y) -> Ans(Sll(x, Var(y)))
  | Closure.Srl(x, y) -> Ans(Srl(x, Var(y)))
  | Closure.FNeg(x) -> Ans(FNeg(x))
  | Closure.FAdd(x, y) -> Ans(FAdd(x, y))
  | Closure.FSub(x, y) -> Ans(FSub(x, y))
  | Closure.FMul(x, y) -> Ans(FMul(x, y))
  | Closure.FDiv(x, y) -> Ans(FDiv(x, y))
  | Closure.I2F(x) -> Ans(FMr(x))
  | Closure.F2I(x) -> Ans(Mr(x))
  | Closure.In -> Ans(In)
  | Closure.Out(x) -> Ans(Out(x))
  | Closure.IfEq(x, y, e1, e2) ->
    (match MiniMap.find x env with
     | Type.Bool | Type.Int -> Ans(IfEq(x, Var(y), virtualize_form env e1, virtualize_form env e2))
     | Type.Float -> Ans(IfFEq(x, y, virtualize_form env e1, virtualize_form env e2))
     | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.IfLE(x, y, e1, e2) ->
    (match MiniMap.find x env with
     | Type.Bool | Type.Int -> Ans(IfLE(x, Var(y), virtualize_form env e1, virtualize_form env e2))
     | Type.Float -> Ans(IfFLE(x, y, virtualize_form env e1, virtualize_form env e2))
     | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.Let((x, t1), e1, e2) ->
    let e1' = virtualize_form env e1 in
    let e2' = virtualize_form (MiniMap.add x t1 env) e2 in
    concat e1' (x, t1) e2'
  | Closure.Var(x) ->
    (match MiniMap.find x env with
     | Type.Unit -> Ans(Nop)
     | Type.Float -> Ans(FMr(x))
     | _ -> Ans(Mr(x)))
  | Closure.MakeCls((x, t), { Closure.entry = l; Closure.actual_free_var = ys}, e2) ->
    (* Closureのアドレスをセットしてから自由変数の値を保存 *)
    let e2' = virtualize_form (MiniMap.add x t env) e2 in
    let offset, store_fv =
      expand
        (List.map (fun y -> (y, MiniMap.find y env)) ys)
        (4, e2')
        (fun y offset store_fv -> seq(Stfd(y, x, Const(offset)), store_fv))
        (fun y _ offset store_fv -> seq(Stw(y, x, Const(offset)), store_fv)) in
    Let((x, t), Mr(reg_heap_p),
        Let((reg_heap_p, Type.Int), Add(reg_heap_p, Const(align offset)),
            let z = Id.gen_id "l" in
            Let((z, Type.Int), SetL(l),
                seq(Stw(z, x, Const(0)),
                    store_fv))))
  | Closure.AppCls(x, ys) ->
    let (int, float) = separate (List.map (fun y -> (y, MiniMap.find y env)) ys) in
    Ans(CallCls(x, int, float))
  | Closure.AppDir(Id.Label(x), ys) ->
    let (int, float) = separate (List.map (fun y -> (y, MiniMap.find y env)) ys) in
    Ans(CallDir(Id.Label(x), int, float))
  | Closure.Tuple(xs) ->
    let y = Id.gen_id "t" in
    let (offset, store) =
      expand
        (List.map (fun x -> (x, MiniMap.find x env)) xs)
        (0, Ans(Mr(y)))
        (fun x offset store -> seq(Stfd(x, y, Const(offset)), store))
        (fun x _ offset store -> seq(Stw(x, y, Const(offset)), store)) in
    Let((y, Type.Tuple(List.map (fun x -> MiniMap.find x env) xs)), Mr(reg_heap_p),
        Let((reg_heap_p, Type.Int), Add(reg_heap_p, Const(align offset)),
            store))
  | Closure.LetTuple(xts, y, e2) ->
    let s = Closure.free_var e2 in
    let (offset, load) =
      expand
        xts
        (0, virtualize_form (MiniMap.add_list xts env) e2)
        (fun x offset load ->
           if not (MiniSet.mem x s) then load
           else fletd(x, Lfd(y, Const(offset)), load))
        (fun x t offset load ->
           if not (MiniSet.mem x s) then load
           else Let((x, t), Lwz(y, Const(offset)), load)) in
    load
  | Closure.Get(x, y) ->
    let offset = Id.gen_id "o" in
    (match MiniMap.find x env with
     | Type.Array(Type.Unit) -> Ans(Nop)
     | Type.Array(Type.Float) ->
       Let((offset, Type.Int), Slw(y, Const(3)),
           Ans(Lfd(x, Var(offset))))
     | Type.Array(_) ->
       Let((offset, Type.Int), Slw(y, Const(2)),
           Ans(Lwz(x, Var(offset))))
     | _ -> assert false)
  | Closure.Put(x, y, z) ->
    let offset = Id.gen_id "o" in
    (match MiniMap.find x env with
     | Type.Array(Type.Unit) -> Ans(Nop)
     | Type.Array(Type.Float) ->
       Let((offset, Type.Int), Slw(y, Const(3)),
           Ans(Stfd(z, x, Var(offset))))
     | Type.Array(_) ->
       Let ((offset, Type.Int), Slw(y, Const(2)),
            Ans(Stw(z, x, Var(offset))))
     | _ -> assert false)
  | Closure.ExtVar(Id.Label(x), t) -> Ans(SetL(Id.Label("min_caml_" ^ x)))
  | Closure.ExtArray(Id.Label(x)) -> Ans(SetL(Id.Label("min_caml_" ^ x)))

(* 仮想マシンコードに変換：関数 *)
let virtualize_fun { Closure.name = (Id.Label(x), t); Closure.args = yts; Closure.formal_free_var = zts; Closure.body = e } =
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (4, virtualize_form (MiniMap.add x t (MiniMap.add_list yts (MiniMap.add_list zts MiniMap.empty))) e)
      (fun z offset load -> fletd(z, Lfd(x, Const(offset)), load))
      (fun z t offset load -> Let((z, t), Lwz(x, Const(offset)), load)) in
  match t with
  | Type.Fun(_, t2) ->
    { name = Id.Label(x); args = int; fargs = float; body = load; ret = t2}
  | _ -> assert false

let main (Closure.Prog(fun_defs, e)) =
  data := [];
  let fun_defs = List.map virtualize_fun fun_defs in
  let e = virtualize_form MiniMap.empty e in
  Prog(!data, fun_defs, e)
