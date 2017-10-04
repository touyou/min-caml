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

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gen_tmp Type.Unit, Type.Unit), e1, e2)

let regs = Array.init 32 (fun i -> Printf.sprintf "%%r%d" i)
let fregs = Array.init 32 (fun i -> Printf.sprintf "%%f%d" i)
let all_regs = Array.to_list regs
let all_fregs = Array.to_list fregs
let reg_closure_addr = regs.(Array.length regs - 2)
let reg_swap = regs.(Array.length regs - 3)
let reg_fswap = fregs.(Array.length fregs - 1)
let reg_stack_p = "%r3"
let reg_heap_p = "%r4"
let reg_tmp = "%r31"
let is_reg x = (x.[0] = '%')

(* 重複を消す *)
let rec remove_add_uniq xs = function
  | [] -> []
  | x :: ys when MiniSet.mem x xs -> remove_add_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (MiniSet.add x xs) ys

let fv_id_or_imm = function Var(x) -> [x] | _ -> []
let rec fv_exp = function
  | Nop | Li(_) | FLi(_) | SetL(_) | Comment(_) | Restore(_) -> []
  | Mr(x) | Neg(x) | FMr(x) | FNeg(x) | Save(x, _) -> [x]
  | Add(x, y') | Sub (x, y') | Mul(x, y') | Div(x, y') | Slw(x, y') | Lfd(x, y') | Lwz(x, y') -> x :: fv_id_or_imm y'
  | Stw(x, y, z') | Stfd(x, y, z') -> x :: y :: fv_id_or_imm z'
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) -> x :: fv_id_or_imm y' @ remove_and_uniq MiniSet.empty (free_var e1 @ free_var e2)
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and free_var = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (MiniSet.singleton x) (free_var e)

let free_var e = remove_and_uniq MiniSet.empty (free_var e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

let align i = (if i mod 8 = 0 then i else i + 4)
