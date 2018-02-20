type id_or_imm = Var of Id.t | Const of int
type t =
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp =
  | Nop
  | Li of int
  | FLi of Id.label
  | SetL of Id.label
  | Mr of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Mul of Id.t * id_or_imm
  | Div of Id.t * id_or_imm
  | Xor of Id.t * id_or_imm
  | Or of Id.t * id_or_imm
  | And of Id.t * id_or_imm
  | Sll of Id.t * id_or_imm
  | Srl of Id.t * id_or_imm
  | Slw of Id.t * id_or_imm
  | Lwz of Id.t * id_or_imm
  | Stw of Id.t * Id.t * id_or_imm
  | FMr of Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | Lfd of Id.t * id_or_imm
  | Stfd of Id.t * Id.t * id_or_imm
  | Comment of string
  | I2F of Id.t
  | F2I of Id.t
  | SQRT of Id.t
  | FABS of Id.t
  | FAddABS of Id.t * Id.t
  | In
  | Out of Id.t
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.label * Id.t list * Id.t list
  | Save of Id.t * Id.t
  | Restore of Id.t
type fun_def = { name : Id.label; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
type prog = Prog of (Id.label * float) list * fun_def list * t

val fletd : Id.t * exp * t -> t
val seq : exp * t -> t

val regs : Id.t array
val fregs : Id.t array
val all_regs : Id.t list
val all_fregs : Id.t list
val reg_closure_addr : Id.t
val reg_swap : Id.t
val reg_fswap : Id.t
val reg_heap_p : Id.t
val reg_stack_p : Id.t
val reg_tmp : Id.t
val is_reg : Id.t -> bool

val free_var : t -> Id.t list
val concat : t -> Id.t * Type.t -> t -> t
