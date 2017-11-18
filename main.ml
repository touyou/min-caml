let limit = ref 1000
let dmode = ref 0b0000
let is_optimize = ref false
let is_start = ref false

(* 最適化のリスト
   Beta β簡約
   Assoc ネストしたletの簡約
   Inline インライン展開
   ConstFold 定数畳み込み
   Cse 共通部分式削除
   Elim 不要定義削除
   Simm 即値の最適化
*)

let rec iter n e =
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
    let beta_converted = Beta.main e in
    (if (!dmode lsr 9) land 1 = 1 then
       print_string ("Beta---\n" ^ (Debug.string_of_knormal beta_converted) ^ "\n\n"));
    let assoced = Assoc.main beta_converted in
    (if (!dmode lsr 8) land 1 = 1 then
       print_string ("Association---\n" ^ (Debug.string_of_knormal assoced) ^ "\n\n"));
    let inlined = Inline.main assoced in
    (if (!dmode lsr 7) land 1 = 1 then
       print_string ("Inlined---\n" ^ (Debug.string_of_knormal inlined) ^ "\n\n"));
    let constfolded = ConstFold.main inlined in
    (if (!dmode lsr 6) land 1 = 1 then
       print_string ("ConstFold---\n" ^ (Debug.string_of_knormal constfolded) ^ "\n\n"));
    let csed = (*Cse.main*) constfolded in
    (if (!dmode lsr 5) land 1 = 1 then
       print_string ("Cse---\n" ^ (Debug.string_of_knormal csed) ^ "\n\n"));
    let e' = Elim.main csed in
    (if (!dmode lsr 4) land 1 = 1 then
       print_string ("Elimination---\n" ^ (Debug.string_of_knormal e') ^ "\n\n"));
    if e = e' then e else
      iter (n - 1) e'

let lexbuf outchan l =
  Id.counter := 0;
  Typing.ext_env := MiniMap.empty;
  let parsed = Parser.exp Lexer.token l in
  (if (!dmode lsr 14) land 1 = 1 then
     print_string ("Parser---\n" ^ (Debug.string_of_syntax parsed) ^ "\n\n"));
  let eta_converted = Eta.main parsed in
  (if (!dmode lsr 13) land 1 = 1 then
     print_string ("Eta---\n" ^ (Debug.string_of_syntax eta_converted) ^ "\n\n"));
  let typed = Typing.main eta_converted in
  (if (!dmode lsr 12) land 1 = 1 then
     print_string ("Typed---\n" ^ (Debug.string_of_syntax typed) ^ "\n\n"));
  let normalized = KNormal.main typed in
  (if (!dmode lsr 11) land 1 = 1 then
     print_string ("kNormal---\n" ^ (Debug.string_of_knormal normalized) ^ "\n\n"));
  let alpha_converted = Alpha.main normalized in
  (if (!dmode lsr 10) land 1 = 1 then
     print_string ("Alpha---\n"  ^ (Debug.string_of_knormal alpha_converted) ^ "\n\n"));
  let opted = (if !is_optimize then iter !limit alpha_converted  else alpha_converted) in
  let closured = Closure.main opted in
  (if (!dmode lsr 3) land 1 = 1 then
     print_string ("Closured---\n" ^ (Debug.string_of_cl_prog closured) ^ "\n\n"));
  let virtualized = Virtual.main closured in
  (if (!dmode lsr 2) land 1 = 1 then
     print_string ("Virtualized---\n" ^ (Debug.string_of_asm_prog virtualized) ^ "\n\n"));
  let simmed = Simm.main virtualized in
  (if (!dmode lsr 1) land 1 = 1 then
     print_string ("Simmed---\n" ^ (Debug.string_of_asm_prog simmed) ^ "\n\n"));
  let allocated = RegAlloc.main simmed in
  (if (!dmode lsr 0) land 1 = 1 then
     print_string ("RegAllocation--\n" ^ (Debug.string_of_asm_prog allocated) ^ "\n\n"));
  Emit.main outchan allocated

let string s = lexbuf stdout (Lexing.from_string s)

let file f =
  let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
  try
    lexbuf outchan (Lexing.from_channel inchan);
    close_in inchan;
    close_out outchan;
  with e -> (close_in inchan; close_out outchan; raise e)

let () =
  let files = ref [] in
  Arg.parse
    [
      ("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
      ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated");
      ("-debug", Arg.String(fun i -> dmode := int_of_string i),
       "debug option by byte number(parse,eta,type,knormal,alpha,beta,assoc,inline,constFold,cse(current invalid),elim,closure,virtual,simm,regalloc)");
      ("-dump-parsed", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 14)), "dumped parsed code");
      ("-dump-eta", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 13)), "dumped eta code");
      ("-dump-typed", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 12)), "dumped typed code");
      ("-dump-knormalized", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 11)), "dumped knormalized code");
      ("-dump-alpha", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 10)), "dumped alpha code");
      ("-dump-beta", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 9)), "dumped beta code");
      ("-dump-assoc", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 8)), "dumped associated code");
      ("-dump-inlined", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 7)), "dumped inlined code");
      ("-dump-const-folded", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 6)), "dumped const folded code");
      ("-dump-cse", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 5)), "dumped cse code");
      ("-dump-eliminated", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 4)), "dumped eliminated code");
      ("-dump-closure", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 3)), "dumped closure code");
      ("-dump-virtualized", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 2)), "dumped virtualized code");
      ("-dump-simm", Arg.Unit(fun () -> dmode := !dmode lor (1 lsl 1)), "dumped simm code");
      ("-dump-regalloc", Arg.Unit(fun () -> dmode := !dmode lor 1), "dumped regalloc code");
      ("-O", Arg.Unit(fun () -> is_optimize := true), "optimization");
      ("-include-start", Arg.Unit(fun () -> is_start := true), "include start section")
    ]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\nedited by touyou. 2017\n" ^
     Printf.sprintf "usage: %s ...filenames without \".ml\"..."
       Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
