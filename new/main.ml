let limit = ref 1000

let lexbuf outchan l =
  Id.counter := 0;
  Typing.ext_env := MiniMap.empty;
  let parsed = Parser.exp Lexer.token l in
  let typed = Typing.main parsed in
  let normalized = KNormal.main typed in
  let closured = Closure.main normalized in
  let virtualized = Virtual.main closured in
  let allocated = RegAlloc.main virtualized in
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
    []
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s ...filenames without \".ml\"..."
       Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
