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
  | LetRec of fun_def * t
  | App of Id.t * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | I2F of Id.t
  | F2I of Id.t
  | SQRT of Id.t
  | FABS of Id.t
  | FAddABS of Id.t * Id.t
  | In of Id.t
  | Out of Id.t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtVar of Id.t * Type.t
  | ExtArray of Id.t
  | ExtFunApp of Id.t * Id.t list
and fun_def = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

val free_var : t -> MiniSet.t
val main : Syntax.t -> t

