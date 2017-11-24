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
  | NTuple of Id.t list * Type.t
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | I2F of Id.t
  | F2I of Id.t
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

val free_var : t -> MiniSet.t
val main : KNormal.t -> prog
