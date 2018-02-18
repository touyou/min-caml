open Asm

type t =
  | Nop of (Id.t * Type.t)
  | Li of (Id.t * Type.t) * int
  | FLi of (Id.t * Type.t) * Id.label
  | SetL of (Id.t * Type.t) * Id.label
  | Mr of (Id.t * Type.t) * Id.t
  | Neg of (Id.t * Type.t) * Id.t
  | Add of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Sub of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Mul of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Div of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Xor of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Or of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | And of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Sll of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Srl of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Lwz of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | Stw of (Id.t * Type.t) * Id.t * Id.t * Asm.id_or_imm
  | FMr of (Id.t * Type.t) * Id.t
  | FNeg of (Id.t * Type.t) * Id.t
  | FAdd of (Id.t * Type.t) * Id.t * Id.t
  | FSub of (Id.t * Type.t) * Id.t * Id.t
  | FMul of (Id.t * Type.t) * Id.t * Id.t
  | FDiv of (Id.t * Type.t) * Id.t * Id.t
  | Lfd of (Id.t * Type.t) * Id.t * Asm.id_or_imm
  | I2F of (Id.t * Type.t) * Id.t
  | F2I of (Id.t * Type.t) * Id.t
  | In of (Id.t * Type.t)
  | Out of (Id.t * Type.t) * Id.t
  | IfEq of (Id.t * Type.t) * Id.t * Asm.id_or_imm * Id.t * Id.t
  | IfLE of (Id.t * Type.t) * Id.t * Asm.id_or_imm * Id.t * Id.t
  | IfGE of (Id.t * Type.t) * Id.t * Asm.id_or_imm * Id.t * Id.t
  | IfFEq of (Id.t * Type.t) * Id.t * Id.t * Id.t * Id.t
  | IfFLE of (Id.t * Type.t) * Id.t * Id.t * Id.t * Id.t
  | CallCls of (Id.t * Type.t) * Id.t * Id.t list * Id.t list
  | CallDir of (Id.t * Type.t) * Id.label * Id.t list * Id.t list
  | Save of (Id.t * Type.t) * Id.t * Id.t
  | Restore of (Id.t * Type.t) * Id.t

type state = {
  mutable id : Id.t;
  mutable parent : Id.t;
  mutable inst : t;
  mutable pred : Id.t;
  mutable succ : Id.t;
  mutable liveIn : MiniSet.t;
  mutable liveOut : MiniSet.t;
}
and block = {
  mutable id : Id.t;
  mutable parent : Id.label;
  mutable state : state MiniMap.t;
  mutable head : Id.t;
  mutable tail : Id.t;
  mutable preds : Id.t list;
  mutable succs : Id.t list;
  mutable liveIn : MiniSet.t;
  mutable liveOut : MiniSet.t;
}
and fun_def = {
  mutable name : Id.label;
  mutable args : Id.t list;
  mutable fargs : Id.t list;
  mutable ret : Type.t;
  mutable blocks : block MiniMap.t;
  mutable head : Id.t;
  mutable def_regs : Id.t list;
}
type prog = Prog of (Id.label * float) list * fun_def list * fun_def

(* 使用する変数のIDリストを返す *)
let get_used_def stat =
  match stat.inst with
  | Nop xt | Li (xt, _) | FLi (xt, _) 
  | SetL (xt, _) | In xt | Restore (xt, _) -> ([fst xt], [])
  | Mr (xt, x) | Neg (xt, x) | Add (xt, x, Const _) | Sub (xt, x , Const _)
  | Mul (xt, x, Const _) | Div (xt, x, Const _) | Xor (xt, x, Const _) | Or (xt, x, Const _)
  | And (xt, x, Const _) | Sll (xt, x, Const _) | Srl (xt, x, Const _) | Lwz (xt, x, Const _)
  | FMr (xt, x) | FNeg (xt, x) | Lfd (xt, x, Const _) | I2F (xt, x) | F2I (xt, x)
  | Out (xt, x) | IfEq (xt, x, Const _, _, _) | IfLE (xt, x, Const _, _, _) | IfGE (xt, x, Const _, _, _)
  | Save (xt, x, _) -> ([fst xt], [x])
  | Add (xt, x, Var y) | Sub (xt, x, Var y) | Mul (xt, x, Var y) | Div (xt, x, Var y)
  | Xor (xt, x, Var y) | Or (xt, x, Var y) | And (xt, x, Var y) | Sll (xt, x, Var y) | Srl (xt, x, Var y)
  | Lwz (xt, x, Var y) | Stw (xt, x, y, Const _) | FAdd (xt, x, y) | FSub (xt, x, y)
  | FMul (xt, x, y) | FDiv (xt, x, y) | Lfd (xt, x, Var y) 
  | IfEq (xt, x, Var y, _, _) | IfLE (xt, x, Var y, _, _) | IfGE (xt, x, Var y, _, _)
  | IfFEq (xt, x, y, _, _) | IfFLE (xt, x, y, _, _) -> ([fst xt], [x; y])
  | Stw (xt, x, y, Var z) -> ([fst xt], [x; y; z])
  | CallCls (_, _, _, _) -> assert false
  | CallDIr (xt, Id.Label name, args, fargs) -> ([fst xt], args @ fargs)

(*  *)