open Asm

let rec simm_insts env = function
  | Ans(exp) -> Ans(simm_inst env exp)
  | Let((x, t), Li(i), e) when -32768 <= i && i < 32768 ->
    let e' = simm_insts (MiniMap.add x i env) e in
    if List.mem x (free_var e') then Let((x, t), Li(i), e') else e'
  | Let(xt, Slw(y, Const(i)), e) when MiniMap.mem y env ->
    simm_insts env (Let(xt, Li((MiniMap.find y env) lsl i), e))
  | Let(xt, exp, e) -> Let(xt, simm_inst env exp, simm_insts env e)
and simm_inst env = function
  | Add(x, Var(y)) when MiniMap.mem y env -> Add(x, Const(MiniMap.find y env))
  | Add(x, Var(y)) when MiniMap.mem x env -> Add(y, Const(MiniMap.find x env))
  | Sub(x, Var(y)) when MiniMap.mem y env -> Sub(x, Const(MiniMap.find y env))
  | Mul(x, Var(y)) when MiniMap.mem y env -> Mul(x, Const(MiniMap.find y env))
  | Mul(x, Var(y)) when MiniMap.mem x env -> Mul(y, Const(MiniMap.find x env))
  | Div(x, Var(y)) when MiniMap.mem y env -> Div(x, Const(MiniMap.find y env))
  | Xor(x, Var(y)) when MiniMap.mem y env -> Xor(x, Const(MiniMap.find y env))
  | Xor(x, Var(y)) when MiniMap.mem x env -> Xor(y, Const(MiniMap.find x env))
  | Or(x, Var(y)) when MiniMap.mem y env -> Or(x, Const(MiniMap.find y env))
  | Or(x, Var(y)) when MiniMap.mem x env -> Or(y, Const(MiniMap.find x env))
  | And(x, Var(y)) when MiniMap.mem y env -> And(x, Const(MiniMap.find y env))
  | And(x, Var(y)) when MiniMap.mem x env -> And(y, Const(MiniMap.find x env))
  | Sll(x, Var(y)) when MiniMap.mem y env -> Sll(x, Const(MiniMap.find y env))
  | Srl(x, Var(y)) when MiniMap.mem y env -> Srl(x, Const(MiniMap.find y env))
  | Slw(x, Var(y)) when MiniMap.mem y env -> Slw(x, Const(MiniMap.find y env))
  | Lwz(x, Var(y)) when MiniMap.mem y env -> Lwz(x, Const(MiniMap.find y env))
  | Stw(x, y, Var(z)) when MiniMap.mem z env -> Stw(x, y, Const(MiniMap.find z env))
  | Lfd(x, Var(y)) when MiniMap.mem y env -> Lfd(x, Const(MiniMap.find y env))
  | Stfd(x, y, Var(z)) when MiniMap.mem z env -> Stfd(x, y, Const(MiniMap.find z env))
  | IfEq(x, Var(y), e1, e2) when MiniMap.mem y env ->
    IfEq(x, Const(MiniMap.find y env), simm_insts env e1, simm_insts env e2)
  | IfEq(x, Var(y), e1, e2) when MiniMap.mem x env ->
    IfEq(y, Const(MiniMap.find x env), simm_insts env e1, simm_insts env e2)
  | IfLE(x, Var(y), e1, e2) when MiniMap.mem y env ->
    IfLE(x, Const(MiniMap.find y env), simm_insts env e1, simm_insts env e2)
  | IfLE(x, Var(y), e1, e2) when MiniMap.mem x env ->
    IfGE(y, Const(MiniMap.find x env), simm_insts env e1, simm_insts env e2)
  | IfGE(x, Var(y), e1, e2) when MiniMap.mem y env ->
    IfGE(x, Const(MiniMap.find y env), simm_insts env e1, simm_insts env e2)
  | IfGE(x, Var(y), e1, e2) when MiniMap.mem x env ->
    IfLE(y, Const(MiniMap.find x env), simm_insts env e1, simm_insts env e2)
  | IfEq(x, y', e1, e2) -> IfEq(x, y', simm_insts env e1, simm_insts env e2)
  | IfLE(x, y', e1, e2) -> IfLE(x, y', simm_insts env e1, simm_insts env e2)
  | IfGE(x, y', e1, e2) -> IfGE(x, y', simm_insts env e1, simm_insts env e2)
  | IfFEq(x, y, e1, e2) -> IfFEq(x, y, simm_insts env e1, simm_insts env e2)
  | IfFLE(x, y, e1, e2) -> IfFLE(x, y, simm_insts env e1, simm_insts env e2)
  | e -> e

let simm_top { name = l; args = xs; fargs = ys; body = e; ret = t } =
  { name = l; args = xs; fargs = ys; body = simm_insts MiniMap.empty e; ret = t }

let main (Prog(data, fundefs, e)) =
  Prog(data, List.map simm_top fundefs, simm_insts MiniMap.empty e)
