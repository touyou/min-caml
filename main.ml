let limit = ref 1000

let rec iter n e =
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
    let e' = Elim.main (ConstFold.main (Inline.main (Assoc.main (Beta.main e)))) in
    if e = e' then e else
      iter (n - 1) e'

let lexbuf outchan l =
  Id.counter := 0;
  Typing.ext_env := MiniMap.empty;
  let parsed = Parser.exp Lexer.token l in
  print_string "Parser---"; print_newline (); Syntax.log parsed; print_newline (); print_newline ();
  let typed = Typing.main parsed in
  let normalized = KNormal.main typed in
  print_string "kNormal---"; print_newline (); KNormal.log normalized; print_newline (); print_newline ();
  let alpha_converted = Alpha.main normalized in
  print_string "Alpha---"; print_newline (); KNormal.log alpha_converted; print_newline (); print_newline ();
  let opted = iter !limit alpha_converted in
  print_string "Optimize---"; print_newline (); KNormal.log alpha_converted; print_newline (); print_newline ();
  let closured = Closure.main opted in
  let virtualized = Virtual.main closured in
  let simmed = Simm.main virtualized in
  let allocated = RegAlloc.main simmed in
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
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\nedited by touyou. 2017\n" ^
     Printf.sprintf "usage: %s ...filenames without \".ml\"..."
       Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
