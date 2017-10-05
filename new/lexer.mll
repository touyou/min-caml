{
  (* lexerで使う変数・関数・型はここに書く  *)
  open Parser
  open Type
}

(* 正規表現 *)
let space   = [' ' '\t']
let newline = '\r' | '\n' | "\r\n"
let digit   = ['0'-'9']
let lower   = ['a'-'z']
let upper   = ['A'-'Z']

(* Lexer.token  *)
rule token = parse
| space+
    { token lexbuf }
| newline
    { Lexing.new_line lexbuf;
      token lexbuf }
| "(*"
    { comment lexbuf;
      token lexbuf }
| '('
    { LPAREN }
| ')'
    { RPAREN }
| "true"
    { BOOL(true) }
| "false"
    { BOOL(false) }
| "not"
    { NOT }
| digit+
    { INT(int_of_string (Lexing.lexeme lexbuf)) }
| digit+ ('.' digit*)? (['e' 'E'] ['+' '-']? digit+)?
    { FLOAT(float_of_string (Lexing.lexeme lexbuf)) }
| '-'
    { MINUS }
| '+'
    { PLUS }
| '*'
    { AST }
| '/'
    { SLASH }
| "-."
    { MINUS_DOT }
| "+."
    { PLUS_DOT }
| "*."
    { AST_DOT }
| "/."
    { SLASH_DOT }
| '='
    { EQUAL }
| "<>"
    { LESS_GREATER }
| "<="
    { LESS_EQUAL }
| ">="
    { GREATER_EQUAL }
| '<'
    { LESS }
| '>'
    { GREATER }
| "if"
    { IF }
| "then"
    { THEN }
| "else"
    { ELSE }
| "let"
    { LET }
| "in"
    { IN }
| "rec"
    { REC }
| ','
    { COMMA }
| '_'
    { IDENT(Id.gen_tmp Type.Unit) }
| "Array.create"
    { ARRAY_CREATE }
| '.'
    { DOT }
| "<-"
    { LESS_MINUS }
| ';'
    { SEMICOLON }
| eof
    { EOF }
| lower (digit|lower|upper|'_')*
    { IDENT(Lexing.lexeme lexbuf) }
| _
    { failwith
        (Printf.sprintf "unknown token: %s line %d, characters %d-%d"
            (Lexing.lexeme lexbuf)
            (lexbuf.lex_curr_p.pos_lnum)
            (Lexing.lexeme_start lexbuf)
            (Lexing.lexeme_end lexbuf)
        ) }
(* コメントがネストしても大丈夫なように  *)
and comment = parse
| "*)"
    { () }
| "(*"
    { comment lexbuf;
      comment lexbuf }
| eof
    { Format.eprintf "warning: unterminated comment@." }
| _
    { comment lexbuf }
