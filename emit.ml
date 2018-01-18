open Asm

external gethi : float -> int32 = "gethi"
external getlo : float -> int32 = "getlo"

(* Saveされた変数の集合 *)
let stack_set = ref MiniSet.empty
(* Saveされた変数のスタック上での位置 *)
let stack_map = ref []

let save x =
  stack_set := MiniSet.add x !stack_set;
  if not (List.mem x !stack_map) then
    stack_map := !stack_map @ [x]

let savef x =
  stack_set := MiniSet.add x !stack_set;
  if not (List.mem x !stack_map) then
    (let pad =
       if List.length !stack_map mod 2 = 0 then [] else [Id.gen_tmp Type.Int] in
     stack_map := !stack_map @ pad @ [x; x])

let locate x =
  let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
  loc !stack_map

let offset x = 4 * List.hd (locate x)

let stack_size () = ((List.length !stack_map + 1) * 4)

let load_label r label =
  Printf.sprintf
    "\taddis\t%s, %%r0, (%s)@h\t# lis\n\tori\t%s, %s, (%s)@l\n"
    r label r r label

(* 関数呼び出しのために引数を並び替え *)
let rec shuffle sw xys =
  (* 同じ場所への移動を削除 *)
  let _, xys = List.partition (fun (x, y) -> x = y) xys in
  (* acyclicな動きを見つける *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | [], [] -> []
  | (x, y) :: xys, [] ->
    (y, sw) :: (x, y) :: shuffle sw (List.map
                                       (function
                                         | (y', z) when y = y' -> (sw, z)
                                         | yz -> yz)
                                       xys)
  | xys, acyc -> acyc @ shuffle sw xys

(* 末尾かどうかを表すデータ型 *)
type dest = Tail | NonTail of Id.t

let rec assemble oc = function
  | dest, Ans(exp) -> assemble_inst oc (dest, exp)
  | dest, Let((x, t), exp, e) ->
    assemble_inst oc (NonTail(x), exp);
    assemble oc (dest, e)
and assemble_inst oc = function
  | NonTail(_), Nop -> ()
  (* li %reg, int *)
  | NonTail(x), Li(i) when -32768 <= i && i < 32768 -> Printf.fprintf oc "\taddi\t%s, %%r0, %d\t# li\n" x i
  (*
    lis %reg, int1
    ori %reg, %reg, int2
  *)
  | NonTail(x), Li(i) ->
    let n = i lsr 16 in
    let m = i lxor (n lsl 16) in
    Printf.fprintf oc "\taddis\t%s, %%r0, %d\t# lis\n" x n;
    Printf.fprintf oc "\tori\t%s, %s, %d\n" x x m
  (* label lfd %reg, 0(%reg) *)
  | NonTail(x), FLi(Id.Label(l)) ->
    let s = load_label reg_tmp l in
    (* let s = Printf.sprintf "\taddis\t%s, %%r0, (%s)@h\t# lis\n" reg_tmp l in *)
    Printf.fprintf oc "%s\tlfs\t%s, 0(%s)\t# float\n" s x reg_tmp
  (* label *)
  | NonTail(x), SetL(Id.Label(y)) ->
    let s = load_label x y in
    Printf.fprintf oc "%s" s
  | NonTail(x), Mr(y) when x = y -> ()
  (* or %r2, %r1, %r2 *)
  | NonTail(x), Mr(y) -> Printf.fprintf oc "\tor\t%s, %s, %s\t# mr %s, %s\n" y x y x y
  (* neg %r1, %r2 *)
  | NonTail(x), Neg(y) -> Printf.fprintf oc "\tneg\t%s, %s\n" x y
  (* add %r1, %r2, %r3 *)
  | NonTail(x), Add(y, Var(z)) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y z
  (* addi %r1, %r2, num *)
  | NonTail(x), Add(y, Const(z)) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y z
  (* sub %r1, %r2, %r3 *)
  | NonTail(x), Sub(y, Var(z)) -> Printf.fprintf oc "\tsubf\t%s, %s, %s\t# sub\t%s, %s, %s\n" x z y x y z
  (*
  addi %r1, %r2, -num
  # subi %r1, %r2, num
  *)
  | NonTail(x), Sub(y, Const(z)) ->
    Printf.fprintf oc "\taddi\t%s, %s, %d\t# subi %s, %s, %d\n" x y (-z) x y z
  (* かけ算割り算は少ないので即値だけシフトに、そうじゃない場合はinvalidをつけた命令を吐く→無視の方向 or float_to_intなどでfmulとかで対処する *)
  | NonTail(x), Mul(y, Var(z)) -> assert false
  (*Printf.fprintf oc "\tinvalid_mull\t%s, %s, %s\n" x y z*)
  | NonTail(x), Mul(y, Const(z)) ->
    Printf.fprintf oc "\taddi\t%%r1, %%r0, %d\t# li\n" (z/2);
    Printf.fprintf oc "\tslw\t%s, %s, %%r1 # swap\n" y x
  | NonTail(x), Div(y, Var(z)) -> assert false
  (*Printf.fprintf oc "\tinvalid_div\t%s, %s, %s\n" x y z*)
  | NonTail(x), Div(y, Const(z)) ->
    Printf.fprintf oc "\taddi\t%%r1, %%r0, %d\t# lis\n" (z/2);
    Printf.fprintf oc "\tsrw\t%s, %s, %%r1 # swap\n" y x
  (* 論理演算周り *)
  | NonTail(x), Xor(y, Var(z)) -> Printf.fprintf oc "\txor\t%s, %s, %s\n" y x z
  | NonTail(x), Xor(y, Const(z)) -> (* Printf.fprintf oc "\txori\t%s, %s, %d\n" y x z *)
    let n = z lsr 16 in
    let m = z lxor (n lsl 16) in
    Printf.fprintf oc "\taddis\t%%r1, %%r0, %d\t# lis\n" n;
    Printf.fprintf oc "\tori\t%%r1, %%r1, %d\n" m;
    Printf.fprintf oc "\txor\t%%r1, %s, %s\n" x y
  | NonTail(x), Or(y, Var(z)) -> Printf.fprintf oc "\tor\t%s, %s, %s\n" y x z
  | NonTail(x), Or(y, Const(z)) -> Printf.fprintf oc "\tori\t%s, %s, %d\n" y x z
  | NonTail(x), And(y, Var(z)) -> Printf.fprintf oc "\tand\t%s, %s, %s\n" y x z
  | NonTail(x), And(y, Const(z)) -> Printf.fprintf oc "\tandi.\t%s, %s, %d\n" y x z
  (* シフト系 *)
  | NonTail(x), Sll(y, Var(z)) -> Printf.fprintf oc "\tslw\t%s, %s, %s # swap\n" y x z
  | NonTail(x), Sll(y, Const(z)) ->
    Printf.fprintf oc "\taddi\t%%r1, %%r0, %d\t# li\n" z;
    Printf.fprintf oc "\tslw\t%s, %s, %%r1 # swap\n" y x
  | NonTail(x), Srl(y, Var(z)) -> Printf.fprintf oc "\tsrw\t%s, %s, %s # swap\n" y x z
  | NonTail(x), Srl(y, Const(z)) ->
    Printf.fprintf oc "\taddi\t%%r1, %%r0, %d\t# lis\n" z;
    Printf.fprintf oc "\tsrw\t%s, %s, %%r1 # swap\n" y x
  (* slw %r1, %r2, %r3 *)
  | NonTail(x), Slw(y, Var(z)) -> Printf.fprintf oc "\tslw\t%s, %s, %s # swap\n" y x z
  (* slwi %r1, %r2, num *)
  | NonTail(x), Slw(y, Const(z)) ->
    Printf.fprintf oc "\taddi\t%%r1, %%r0, %d\t# li\n" z;
    Printf.fprintf oc "\tslw\t%s, %s, %%r1 # swap\n" y x
  (* lwzx %r1, %r2, %r3 *)
  | NonTail(x), Lwz(y, Var(z)) -> (* Printf.fprintf oc "\tlwzx\t%s, %s, %s\n" x y z *)
    Printf.fprintf oc "\tadd %%r1, %s, %s\n" y z;
    Printf.fprintf oc "\tlwz %s, 0(%%r1)\n" x
  (* lwz %r1, num(%r2) *)
  | NonTail(x), Lwz(y, Const(z)) -> Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" x z y
  (* stwx %r1, %r2, %r3 *)
  | NonTail(_), Stw(x, y, Var(z)) -> (* Printf.fprintf oc "\tstwx\t%s, %s, %s\n" x y z *)
    Printf.fprintf oc "\tadd %%r1, %s, %s\n" y z;
    Printf.fprintf oc "\tstw %s, 0(%%r1)\n" x
  (* stw %r1, num(%r2) *)
  | NonTail(_), Stw(x, y, Const(z)) -> Printf.fprintf oc "\tstw\t%s, %d(%s)\n" x z y
  | NonTail(x), FMr(y) when x = y -> ()
  (* fmr %r1, %r2 *)
  | NonTail(x), FMr(y) -> Printf.fprintf oc "\tfmr\t%s, %s\n" x y
  (* fneg %r1, %r2 *)
  | NonTail(x), FNeg(y) -> Printf.fprintf oc "\tfneg\t%s, %s\n" x y
  (* fadd %r1, %r2, %r3 *)
  | NonTail(x), FAdd(y, z) -> Printf.fprintf oc "\tfadd\t%s, %s, %s\n" x y z
  (* fsub %r1, %r2, %r3 *)
  | NonTail(x), FSub(y, z) -> Printf.fprintf oc "\tfsub\t%s, %s, %s\n" x y z
  (* fmul %r1, %r2, %r3 *)
  | NonTail(x), FMul(y, z) -> Printf.fprintf oc "\tfmul\t%s, %s, %s\n" x y z
  (* fdiv %r1, %r2, %r3 *)
  | NonTail(x), FDiv(y, z) -> Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" x y z
  (* lfdx %r1, %r2, %r3 *)
  | NonTail(x), Lfd(y, Var(z)) -> (* Printf.fprintf oc "\tlfdx\t%s, %s, %s\n" x y z *)
    Printf.fprintf oc "\tadd %%r1, %s, %s\n" y z;
    Printf.fprintf oc "\tlfs %s, 0(%%r1)\n" x
  (* lfd %r1, num(%r2) *)
  | NonTail(x), Lfd(y, Const(z)) -> Printf.fprintf oc "\tlfs\t%s, %d(%s)\t# float\n" x z y
  (* stfdx %r1, %r2, %r3 *)
  | NonTail(_), Stfd(x, y, Var(z)) -> (* Printf.fprintf oc "\tstfdx\t%s, %s, %s\n" x y z *)
    Printf.fprintf oc "\tadd %%r1, %s, %s\n" y z;
    Printf.fprintf oc "\tstfs %s, 0(%%r1)\n" x
  (* stfd %r1, num(%r2) *)
  | NonTail(_), Stfd(x, y, Const(z)) -> Printf.fprintf oc "\tstfs\t%s, %d(%s)\t# float\n" x z y
  (* comment *)
  | NonTail(_), Comment(s) -> Printf.fprintf oc "#\t%s\n" s
  (* TO-DO: 入出力 *)
  | NonTail(x), In -> (* Printf.fprintf oc "\tin\t%s, %d\n" x 0 *)
    let inlabel = Id.gen_id ("in") in
    (
      let i = 0xF0001014 in
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      Printf.fprintf oc "%s:\n" inlabel;
      Printf.fprintf oc "\taddis\t%s, %%r0, %d\t# lis\n" "%r1" n;
      Printf.fprintf oc "\tori\t%s, %s, %d\n" "%r1" "%r1" m;
      Printf.fprintf oc "\tlwz\t%%r1, 0(%%r1)\n";
      Printf.fprintf oc "\tandis.\t%%r1, %%r1, 0x0100\n";
      Printf.fprintf oc "\tbeq\t%%cr0, %s\n" inlabel
    );
    (
      let i = 0xF0001000 in
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      Printf.fprintf oc "\taddis\t%s, %%r0, %d\t# lis\n" "%r1" n;
      Printf.fprintf oc "\tori\t%s, %s, %d\n" "%r1" "%r1" m;
      Printf.fprintf oc "\tlwz\t%s, 0(%%r1)\n" x;
      Printf.fprintf oc "\taddi\t%%r1, %%r0, 24\t# lis\n";
      Printf.fprintf oc "\tsrw\t%s, %s, %%r1 # swap\n" x x;
    )
  | NonTail(x), Out(y) -> (* Printf.fprintf oc "\tout\t%s, %d\n" y 0 *)
    let outlabel = Id.gen_id ("out") in
    (
      let i = 0xF0001014 in
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      Printf.fprintf oc "%s:\n" outlabel;
      Printf.fprintf oc "\taddis\t%s, %%r0, %d\t# lis\n" "%r1" n;
      Printf.fprintf oc "\tori\t%s, %s, %d\n" "%r1" "%r1" m;
      Printf.fprintf oc "\tlwz\t%%r1, 0(%%r1)\n";
      Printf.fprintf oc "\tandis.\t%%r1, %%r1, 0x4000\n";
      Printf.fprintf oc "\tbeq\t%%cr0, %s\n" outlabel
    );
    (
      let i = 0xF0001000 in
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      Printf.fprintf oc "\taddi\t%%r1, %%r0, 24\t# lis\n";
      Printf.fprintf oc "\tslw\t%s, %s, %%r1 # swap\n" y y;
      Printf.fprintf oc "\taddis\t%s, %%r0, %d\t# lis\n" "%r1" n;
      Printf.fprintf oc "\tori\t%s, %s, %d\n" "%r1" "%r1" m;
      Printf.fprintf oc "\tstw\t%s, 0(%%r1)\n" y;
      Printf.fprintf oc "\taddi\t%%r1, %%r0, 24\t# lis\n";
      Printf.fprintf oc "\tsrw\t%s, %s, %%r1 # swap\n" y y;
    )
  (* 待避の実装 *)
  | NonTail(_), Save(x, y) when List.mem x all_regs && not (MiniSet.mem y !stack_set) ->
    save y;
    Printf.fprintf oc "\tstw\t%s, %d(%s)\n" x (offset y) reg_stack_p
  | NonTail(_), Save(x, y) when List.mem x all_fregs && not (MiniSet.mem y !stack_set) ->
    savef y;
    Printf.fprintf oc "\tstfs\t%s, %d(%s)\t# float\n" x (offset y) reg_stack_p
  | NonTail(_), Save(x, y) -> assert (MiniSet.mem y !stack_set); ()
  (* 復帰の実装 *)
  | NonTail(x), Restore(y) when List.mem x all_regs ->
    Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" x (offset y) reg_stack_p
  | NonTail(x), Restore(y) ->
    assert (List.mem x all_fregs);
    Printf.fprintf oc "\tlfs\t%s, %d(%s)\t# float\n" x (offset y) reg_stack_p
  (* 末尾なら計算結果を第一レジスタにセットしてリターン *)
  | Tail, (Nop | Out(_) | Stw(_) | Stfd(_) | Comment(_) | Save(_) as exp) ->
    assemble_inst oc (NonTail(Id.gen_tmp Type.Unit), exp);
    Printf.fprintf oc "\tblr\n"
  | Tail, (Li(_) | SetL(_) | Mr(_) | Neg(_) | Add(_) | Sub(_) | Mul(_) | Div(_)
          | Xor(_) | Or(_) | And(_) | Sll(_) | Srl(_)
          | Slw(_) | Lwz(_) as exp) ->
    assemble_inst oc (NonTail(regs.(0)), exp);
    Printf.fprintf oc "\tblr\n"
  | Tail, (FLi(_) | FMr(_) | FNeg(_) | FAdd(_) | FSub(_) | FMul(_) | FDiv(_) | Lfd(_) as exp) ->
    assemble_inst oc (NonTail(fregs.(0)), exp);
    Printf.fprintf oc "\tblr\n"
  | Tail, (Restore(x) as exp) ->
    (match locate x with
     | [i] -> assemble_inst oc (NonTail(regs.(0)), exp)
     | [i; j] when i + 1 = j -> assemble_inst oc (NonTail(fregs.(0)), exp)
     | _ -> assert false);
    Printf.fprintf oc "\tblr\n"
  (* 条件分岐：末尾 *)
  | Tail, IfEq(x, Var(y), e1, e2)->
    Printf.fprintf oc "\tcmp\t%%cr7, %s, %s\n" x y;
    assemble_tail_if oc e1 e2 "beq" "bne" (* beq bne *)
  | Tail, IfEq(x, Const(y), e1, e2)->
    Printf.fprintf oc "\tcmpwi\t%%cr7, %s, %d\n" x y;
    assemble_tail_if oc e1 e2 "beq" "bne" (* beq bne *)
  | Tail, IfLE(x, Var(y), e1, e2)->
    Printf.fprintf oc "\tcmp\t%%cr7, %s, %s\n" x y;
    assemble_tail_if oc e1 e2 "ble" "bgt" (* ble bgt *)
  | Tail, IfLE(x, Const(y), e1, e2)->
    Printf.fprintf oc "\tcmpwi\t%%cr7, %s, %d\n" x y;
    assemble_tail_if oc e1 e2 "ble" "bgt" (* ble bgt *)
  | Tail, IfGE(x, Var(y), e1, e2)->
    Printf.fprintf oc "\tcmp\t%%cr7, %s, %s\n" x y;
    assemble_tail_if oc e1 e2 "bge" "blt" (* bge blt *)
  | Tail, IfGE(x, Const(y), e1, e2)->
    Printf.fprintf oc "\tcmpwi\t%%cr7, %s, %d\n" x y;
    assemble_tail_if oc e1 e2 "bge" "blt" (* bge blt *)
  | Tail, IfFEq(x, y, e1, e2)->
    Printf.fprintf oc "\tfcmpu\t%%cr7, %s, %s\n" x y;
    assemble_tail_if oc e1 e2 "beq" "bne" (* beq bne *)
  | Tail, IfFLE(x, y, e1, e2)->
    Printf.fprintf oc "\tfcmpu\t%%cr7, %s, %s\n" x y;
    assemble_tail_if oc e1 e2 "ble" "bgt" (* ble bgt *)
  (* 条件分岐：末尾じゃない *)
  | NonTail(z), IfEq(x, Var(y), e1, e2) ->
    Printf.fprintf oc "\tcmp\t%%cr7, %s, %s\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "beq" "bne" (* beq bne *)
  | NonTail(z), IfEq(x, Const(y), e1, e2) ->
    Printf.fprintf oc "\tcmpwi\t%%cr7, %s, %d\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "beq" "bne" (* beq bne *)
  | NonTail(z), IfLE(x, Var(y), e1, e2) ->
    Printf.fprintf oc "\tcmp\t%%cr7, %s, %s\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bgt" (* ble bgt *)
  | NonTail(z), IfLE(x, Const(y), e1, e2) ->
    Printf.fprintf oc "\tcmpwi\t%%cr7, %s, %d\t\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bgt" (* ble bgt *)
  | NonTail(z), IfGE(x, Var(y), e1, e2) ->
    Printf.fprintf oc "\tcmp\t%%cr7, %s, %s\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "bge" "blt" (* bge blt *)
  | NonTail(z), IfGE(x, Const(y), e1, e2) ->
    Printf.fprintf oc "\tcmpwi\t%%cr7, %s, %d\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "bge" "blt" (* bge blt *)
  | NonTail(z), IfFEq(x, y, e1, e2) ->
    Printf.fprintf oc "\tfcmpu\t%%cr7, %s, %s\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "beq" "bne" (* beq bne *)
  | NonTail(z), IfFLE(x, y, e1, e2) ->
    Printf.fprintf oc "\tfcmpu\t%%cr7, %s, %s\n" x y;
    assemble_non_tail_if oc (NonTail(z)) e1 e2 "ble" "bgt" (* ble bgt *)
  (* 関数呼び出し *)
  | Tail, CallCls(x, ys, zs) ->
    assemble_args oc [(x, reg_closure_addr)] ys zs;
    Printf.fprintf oc "\tlwz\t%s, 0(%s)\n" reg_swap reg_closure_addr;
    Printf.fprintf oc "\tmtctr\t%s\t\n\tbctr\n" reg_swap
  | Tail, CallDir(Id.Label(x), ys, zs) ->
    assemble_args oc [] ys zs;
    Printf.fprintf oc "\tb\t%s\n" x
  (* 末尾でない場合一旦待避するみたいな感じになる *)
  | NonTail(a), CallCls(x, ys, zs) ->
    Printf.fprintf oc "\tmflr\t%s\t\n" reg_tmp;
    assemble_args oc [(x, reg_closure_addr)] ys zs;
    let ss = stack_size () in
    Printf.fprintf oc "\tstw\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_stack_p;
    Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_stack_p reg_stack_p ss;
    Printf.fprintf oc "\tlwz\t%s, 0(%s)\n" reg_tmp reg_closure_addr;
    Printf.fprintf oc "\tmtctr\t%s\t\n" reg_tmp;
    Printf.fprintf oc "\tbctrl\n";
    Printf.fprintf oc "\taddi\t%s, %s, %d\t# subi\n" reg_stack_p reg_stack_p (-ss);
    Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_stack_p;
    if List.mem a all_regs && a <> regs.(0) then
      Printf.fprintf oc "\tor\t%s, %s, %s\t# mr %s, %s\n" regs.(0) a regs.(0) a regs.(0)
    else if List.mem a all_fregs && a <> fregs.(0) then
      Printf.fprintf oc "\tfmr\t%s, %s\n" a fregs.(0);
    Printf.fprintf oc "\tmtlr\t%s\t\n" reg_tmp
  | NonTail(a), CallDir(Id.Label(x), ys, zs) ->
    Printf.fprintf oc "\tmflr\t%s\t\n" reg_tmp;
    assemble_args oc [] ys zs;
    let ss = stack_size () in
    Printf.fprintf oc "\tstw\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_stack_p;
    Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_stack_p reg_stack_p ss;
    Printf.fprintf oc "\tbl\t%s\n" x;
    Printf.fprintf oc "\taddi\t%s, %s, %d\t# subi\n" reg_stack_p reg_stack_p (-ss);
    Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" reg_tmp (ss - 4) reg_stack_p;
    if List.mem a all_regs && a <> regs.(0) then
      Printf.fprintf oc "\tor\t%s, %s, %s\t# mr %s, %s\n" regs.(0) a regs.(0) a regs.(0)
    else if List.mem a all_fregs && a <> fregs.(0) then
      Printf.fprintf oc "\tfmr\t%s, %s\n" a fregs.(0);
    Printf.fprintf oc "\tmtlr\t%s\t\n" reg_tmp
  | NonTail(a), I2F(x) -> (* stwしてからlfd *)
    let ss = stack_size () in
    Printf.fprintf oc "\tstw\t%s, %d(%s)\n" x (ss - 4) reg_stack_p;
    Printf.fprintf oc "\tlfs\t%s, %d(%s)\t# float\n" a (ss - 4) reg_stack_p;
    (*if List.mem a all_fregs && a <> fregs.(0) then
      Printf.fprintf oc "\tfmr\t%s, %s\n" fregs.(0) a*)
  | NonTail(a), F2I(x) -> (* stfdしてからlwz *)
    let ss = stack_size () in
    Printf.fprintf oc "\tstfs\t%s, %d(%s)\t# float\n" x (ss - 4) reg_stack_p;
    Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" a (ss - 4) reg_stack_p;
    (*if List.mem a all_regs && a <> regs.(0) then
      Printf.fprintf oc "\tor\t%s, %s, %s\t# mr %s, %s\n" a regs.(0) a regs.(0) a*)
  | Tail, I2F(x) ->
    let ss = stack_size () in
    Printf.fprintf oc "\tstw\t%s, %d(%s)\n" x (ss - 4) reg_stack_p;
    Printf.fprintf oc "\tlfs\t%s, %d(%s)\t# float\n" fregs.(0) (ss - 4) reg_stack_p;
    Printf.fprintf oc "\tblr\n"
  | Tail, F2I(x) ->
    let ss = stack_size () in
    Printf.fprintf oc "\tstfs\t%s, %d(%s)\t# float\n" x (ss - 4) reg_stack_p;
    Printf.fprintf oc "\tlwz\t%s, %d(%s)\n" regs.(0) (ss - 4) reg_stack_p;
    Printf.fprintf oc "\tblr\n"
  | Tail, In ->
    Printf.fprintf oc "\tin\t%%r2, 0\n\tblr\n"
  | Tail, e ->
    (Format.eprintf "error tail: %s@." (Debug.string_of_asm_t (Ans(e))); assert false)
and assemble_tail_if oc e1 e2 b bn =
  let b_else = Id.gen_id (b ^ "_else") in
  Printf.fprintf oc "\t%s\t%%cr7, %s\n" bn b_else;
  let stackset_back = !stack_set in
  assemble oc (Tail, e1);
  Printf.fprintf oc "%s:\n" b_else;
  stack_set := stackset_back;
  assemble oc (Tail, e2)
and assemble_non_tail_if oc dest e1 e2 b bn =
  let b_else = Id.gen_id (b ^ "_else") in
  let b_cont = Id.gen_id (b ^ "_cont") in
  Printf.fprintf oc "\t%s\t%%cr7, %s\n" bn b_else;
  let stackset_back = !stack_set in
  assemble oc (dest, e1);
  let stackset1 = !stack_set in
  Printf.fprintf oc "\tb\t%s\n" b_cont;
  Printf.fprintf oc "%s:\n" b_else;
  stack_set := stackset_back;
  assemble oc (dest, e2);
  Printf.fprintf oc "%s:\n" b_cont;
  let stackset2 = !stack_set in
  stack_set := MiniSet.inter stackset1 stackset2
and assemble_args oc x_reg_cl ys zs =
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> Printf.fprintf oc "\tor\t%s, %s, %s\t# mr %s, %s\n" y r y r y)
    (shuffle reg_swap yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> Printf.fprintf oc "\tfmr\t%s, %s\n" fr z)
    (shuffle reg_fswap zfrs)

let assemble_fun oc { name = Id.Label(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stack_set := MiniSet.empty;
  stack_map := [];
  assemble oc (Tail, e)

let main oc array_str (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc "\t.globl _start\n";
  Printf.fprintf oc "\t.text\n";
  Printf.fprintf oc "_start:\n";
  Printf.fprintf oc "# 0x000000 | code & data seg |\n";
  Printf.fprintf oc "# 0x2_0000 | stack       seg |\n";
  Printf.fprintf oc "# 0x8_0000 | heap        seg |\n";
  Printf.fprintf oc "\tlis\t%%r3, 0x0002\t# sp\n";
  Printf.fprintf oc "\tlis\t%%r4, 0x0008\t# hp\n";
  Printf.fprintf oc "\tb\t_min_caml_start\n";
  (* create_arrayを埋め込む *)
  Printf.fprintf oc "%s" array_str;
  if data <> [] then
    (Printf.fprintf oc "\t.data\n\t#.literal8\n";
     List.iter
       (fun (Id.Label(x), d) ->
          Printf.fprintf oc "\t.align 2\n";
          Printf.fprintf oc "%s:\t # %f\n" x d;
          Printf.fprintf oc "\t.long\t%d\n" (Type.conv_float d))
          (* Printf.fprintf oc "\t.long\t%ld\n" (gethi d);
          Printf.fprintf oc "\t.long\t%ld\n" (getlo d)) *)
       data);
  Printf.fprintf oc "\t.text\n";
  Printf.fprintf oc "\t.globl _min_caml_start\n";
  Printf.fprintf oc "\t.align 2\n";
  List.iter (fun fundef -> assemble_fun oc fundef) fundefs;
  Printf.fprintf oc "_min_caml_start: # main entry point\n";
  (* Printf.fprintf oc "\tmflr\t%r0\t\n";
  Printf.fprintf oc "\tstmw\t%%r30, -8(%%r1)\n";
  Printf.fprintf oc "\tstw\t%%r0, 8(%%r1)\n";
  Printf.fprintf oc "\tstwu\t%%r1, -96(%%r1)\n"; *)
  Printf.fprintf oc "#\tmain program starts\n";
  stack_set := MiniSet.empty;
  stack_map := [];
  assemble oc (NonTail("_R_0"), e);
  Printf.fprintf oc "#\tmain program ends\n";
  Printf.fprintf oc "\tsc\n"
  (* Printf.fprintf oc "\tlwz\t%%r1, 0(%%r1)\n";
  Printf.fprintf oc "\tlwz\t%%r0, 8(%%r1)\n";
  Printf.fprintf oc "\tmtlr\t%%r0\t\n";
  Printf.fprintf oc "\tlmw\t%%r30, -8(%%r1)\n";
  Printf.fprintf oc "\tbclr\t20, %%cr0\t# blr\n" *)
