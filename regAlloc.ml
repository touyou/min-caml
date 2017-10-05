open Asm

(* Callがあったらそこから先は逆効果なので追わない。
   そのために「Callの有無」を返り値の第１要素に含める。 *)
let rec target' src (dest, t) = function
  | Mr(x) when x = src && is_reg dest ->
    assert (t <> Type.Unit);
    assert (t <> Type.Float);
    false, [dest]
  | FMr(x) when x = src && is_reg dest ->
    assert (t = Type.Float);
    false, [dest]
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | IfGE(_, _, e1, e2)
  | IfFEq(_, _, e1, e2) | IfFLE(_, _, e1, e2) ->
    let c1, rs1 = target src (dest, t) e1 in
    let c2, rs2 = target src (dest, t) e2 in
    c1 && c2, rs1 @ rs2
  | CallCls(x, ys, zs) ->
    true, (target_args src regs 0 ys @
           target_args src fregs 0 zs @
           if x = src then [reg_closure_addr] else [])
  | CallDir(_, ys, zs) ->
    true, (target_args src regs 0 ys @
           target_args src fregs 0 zs)
  | _ -> false, []
and target src dest = function
  | Ans(exp) -> target' src dest exp
  | Let(xt, exp, e) ->
    let c1, rs1 = target' src xt exp in
    if c1 then true, rs1
    else
      let c2, rs2 = target src dest e in
      c2, rs1 @ rs2
and target_args src all n = function
  | [] -> []
  | y :: ys when src = y -> all.(n) :: target_args src all (n + 1) ys
  | _ :: ys -> target_args src all (n + 1) ys

(* allocにおいてspilingがあったかどうかを表すデータ型 *)
type alloc_result =
  | Alloc of Id.t
  | Spill of Id.t

let rec alloc dest cont regenv x t =
  assert (not (MiniMap.mem x regenv));
  let all =
    match t with
    (* dummy *)
    | Type.Unit -> ["%r0"]
    | Type.Float -> all_fregs
    | _ -> all_regs in
  if all = ["%r0"] then Alloc("%r0") else
  if is_reg x then Alloc(x) else
    let free = free_var cont in
    try
      let (c, prefer) = target x dest cont in
      (* 生きているレジスタ *)
      let live =
        List.fold_left
          (fun live y ->
             if is_reg y then MiniSet.add y live else
               try MiniSet.add (MiniMap.find y regenv) live
               with Not_found -> live)
          MiniSet.empty
          free in
      (* その他 *)
      let rest =
        List.find
          (fun rest -> not (MiniSet.mem rest live))
          (prefer @ all) in
      Alloc(rest)
    with Not_found ->
      Format.eprintf "register allocation failed for %s@." x;
      let y =
        List.find
          (fun y ->
             not (is_reg y) &&
             try List.mem (MiniMap.find y regenv) all
             with Not_found -> false)
          (List.rev free) in
      Format.eprintf "spilling %s from %s@." y (MiniMap.find y regenv);
      Spill(y)

(* レジスタの追加・検索などのユーティリティ *)
exception NoReg of Id.t * Type.t

let add x r regenv =
  if is_reg x then (assert (x = r); regenv)
  else MiniMap.add x r regenv

let find x t regenv =
  if is_reg x then x else
    try MiniMap.find x regenv
    with Not_found -> raise (NoReg(x, t))

let find' x' regenv =
  match x' with
  | Var(x) -> Var(find x Type.Int regenv)
  | c -> c

(* レジスタ割り当て：命令列 *)
let rec alloc_insts dest cont regenv = function
  | Ans(exp) -> alloc_inst_and_restore dest cont regenv exp
  | Let((x, t) as xt, exp, e) ->
    assert (not (MiniMap.mem x regenv));
    let cont' = concat e dest cont in
    let (e1', regenv1) = alloc_inst_and_restore xt cont' regenv exp in
    (match alloc dest cont' regenv1 x t with
     | Spill(y) ->
       let r = MiniMap.find y regenv1 in
       let (e2', regenv2) = alloc_insts dest cont (add x r (MiniMap.remove y regenv1)) e in
       let save =
         try Save(MiniMap.find y regenv, y)
         with Not_found -> Nop in
       (seq(save, concat e1' (r, t) e2'), regenv2)
     | Alloc(r) ->
       let (e2', regenv2) = alloc_insts dest cont (add x r regenv1) e in
       (concat e1' (r, t) e2', regenv2))
(* 使用される変数をスタックからレジスタへリストア *)
and alloc_inst_and_restore dest cont regenv exp =
  try alloc_inst dest cont regenv exp
  with NoReg(x, t) ->
    (alloc_insts dest cont regenv (Let((x, t), Restore(x), Ans(exp))))
and alloc_inst dest cont regenv = function
  | Nop | Li(_) | SetL(_) | Comment(_) | Restore(_) | FLi(_) as exp -> (Ans(exp), regenv)
  | Mr(x) -> (Ans(Mr(find x Type.Int regenv)), regenv)
  | Neg(x) -> (Ans(Neg(find x Type.Int regenv)), regenv)
  | Add(x, y') -> (Ans(Add(find x Type.Int regenv, find' y' regenv)), regenv)
  | Sub(x, y') -> (Ans(Sub(find x Type.Int regenv, find' y' regenv)), regenv)
  | Mul(x, y') -> (Ans(Mul(find x Type.Int regenv, find' y' regenv)), regenv)
  | Div(x, y') -> (Ans(Div(find x Type.Int regenv, find' y' regenv)), regenv)
  | Slw(x, y') -> (Ans(Slw(find x Type.Int regenv, find' y' regenv)), regenv)
  | Lwz(x, y') -> (Ans(Lwz(find x Type.Int regenv, find' y' regenv)), regenv)
  | Stw(x, y, z') -> (Ans(Stw(find x Type.Int regenv, find y Type.Int regenv, find' z' regenv)), regenv)
  | FMr(x) -> (Ans(FMr(find x Type.Float regenv)), regenv)
  | FNeg(x) -> (Ans(FNeg(find x Type.Float regenv)), regenv)
  | FAdd(x, y) -> (Ans(FAdd(find x Type.Float regenv, find y Type.Float regenv)), regenv)
  | FSub(x, y) -> (Ans(FSub(find x Type.Float regenv, find y Type.Float regenv)), regenv)
  | FMul(x, y) -> (Ans(FMul(find x Type.Float regenv, find y Type.Float regenv)), regenv)
  | FDiv(x, y) -> (Ans(FDiv(find x Type.Float regenv, find y Type.Float regenv)), regenv)
  | Lfd(x, y') -> (Ans(Lfd(find x Type.Int regenv, find' y' regenv)), regenv)
  | Stfd(x, y, z') -> (Ans(Stfd(find x Type.Float regenv, find y Type.Int regenv, find' z' regenv)), regenv)
  | IfEq(x, y', e1, e2) as exp -> alloc_if dest cont regenv exp (fun e1' e2' -> IfEq(find x Type.Int regenv, find' y' regenv, e1', e2')) e1 e2
  | IfLE(x, y', e1, e2) as exp -> alloc_if dest cont regenv exp (fun e1' e2' -> IfLE(find x Type.Int regenv, find' y' regenv, e1', e2')) e1 e2
  | IfGE(x, y', e1, e2) as exp -> alloc_if dest cont regenv exp (fun e1' e2' -> IfGE(find x Type.Int regenv, find' y' regenv, e1', e2')) e1 e2
  | IfFEq(x, y, e1, e2) as exp -> alloc_if dest cont regenv exp (fun e1' e2' -> IfFEq(find x Type.Float regenv, find y Type.Float regenv, e1', e2')) e1 e2
  | IfFLE(x, y, e1, e2) as exp -> alloc_if dest cont regenv exp (fun e1' e2' -> IfFLE(find x Type.Float regenv, find y Type.Float regenv, e1', e2')) e1 e2
  | CallCls(x, ys, zs) as exp ->
    if List.length ys > Array.length regs - 2 || List.length zs > Array.length fregs - 1 then
      failwith (Format.sprintf "cannot allocate registers for arguments to %s" x)
    else
      alloc_call dest cont regenv exp (fun ys zs -> CallCls(find x Type.Int regenv, ys, zs)) ys zs
  | CallDir(Id.Label(x), ys, zs) as exp ->
    if List.length ys > Array.length regs - 1 || List.length zs > Array.length fregs - 1 then
      failwith (Format.sprintf "cannot allocate registe for arguments to %s" x)
    else
      alloc_call dest cont regenv exp (fun ys zs -> CallDir(Id.Label(x), ys, zs)) ys zs
  | Save(x, y) -> assert false
and alloc_if dest cont regenv exp constr e1 e2 =
  let (e1', regenv1) = alloc_insts dest cont regenv e1 in
  let (e2', regenv2) = alloc_insts dest cont regenv e2 in
  let regenv' =
    List.fold_left
      (fun regenv' x ->
         try
           if is_reg x then regenv' else
             let r1 = MiniMap.find x regenv1 in
             let r2 = MiniMap.find x regenv2 in
             if r1 <> r2 then regenv'
             else MiniMap.add x r1 regenv'
         with Not_found -> regenv')
      MiniMap.empty
      (free_var cont) in
  (List.fold_left
     (fun e x ->
        if x = fst dest || not (MiniMap.mem x regenv) || MiniMap.mem x regenv' then e
        else seq(Save(MiniMap.find x regenv, x), e))
     (Ans(constr e1' e2'))
     (free_var cont),
   regenv')
and alloc_call dest cont regenv exp constr ys zs =
  (List.fold_left
     (fun e x ->
        if x = fst dest || not (MiniMap.mem x regenv) then e
        else seq(Save(MiniMap.find x regenv, x), e))
     (Ans(constr
            (List.map (fun y -> find y Type.Int regenv) ys)
            (List.map (fun z -> find z Type.Float regenv) zs)))
     (free_var cont),
   MiniMap.empty)

let alloc_fun { name = Id.Label(x); args = ys; fargs = zs; body = e; ret = t } =
  let regenv = MiniMap.add x reg_closure_addr MiniMap.empty in
  let (i, arg_regs, regenv) =
    List.fold_left
      (fun (i, arg_regs, regenv) y ->
         let r = regs.(i) in
         (i + 1,
          arg_regs @ [r],
          (assert (not (is_reg y));
           MiniMap.add y r regenv)))
      (0, [], regenv)
      ys in
  let (d, farg_regs, regenv) =
    List.fold_left
      (fun (d, farg_regs, regenv) z ->
         let fr = fregs.(d) in
         (d + 1,
          farg_regs @ [fr],
          (assert (not (is_reg z));
           MiniMap.add z fr regenv)))
      (0, [], regenv)
      zs in
  let a =
    match t with
    | Type.Unit -> Id.gen_tmp Type.Unit
    | Type.Float -> fregs.(0)
    | _ -> regs.(0) in
  let (e', regenv') = alloc_insts (a, t) (Ans(Mr(a))) regenv e in
  { name = Id.Label(x); args = arg_regs; fargs = farg_regs; body = e'; ret = t }

let main (Prog(data, fundefs, e)) =
  Format.eprintf "register allocation: may take some time (up to a few minutes, depending on the size of functions)@.";
  let fundefs' = List.map alloc_fun fundefs in
  let e', regenv' = alloc_insts (Id.gen_tmp Type.Unit, Type.Unit) (Ans(Nop)) MiniMap.empty e in
  Prog(data, fundefs', e')