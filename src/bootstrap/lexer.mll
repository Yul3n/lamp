{
  open Parser
  open Lexing
}

let var = ['_' 'a'-'z' 'A'-'Z'] ['_' 'a'-'z' 'A'-'Z' '0'-'9']*

rule lex = parse
    "--" [^'\n']* '\n' { Lexing.new_line lexbuf; lex lexbuf }
  | "->"               { ARR }
  | '='                { EQU }
  | '\n'               { Lexing.new_line lexbuf; lex lexbuf }
  | '('                { LPAR }
  | ')'                { RPAR }
  | ';'                { SEMI }
  | var                { IDE(lexeme lexbuf) }
  | eof                { EOF }