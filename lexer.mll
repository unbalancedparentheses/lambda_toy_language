{
  open Parser
}

rule token = parse
  | [' ' '\t']      { token lexbuf }
  | ['\n' ]         { EOL }
  | ['0'-'9']+ as i { Parser.NUMERAL (int_of_string i) }
  | '+'             { Parser.PLUS }
  | '-'             { Parser.MINUS }
  | '*'             { Parser.TIMES }
  | '/'             { Parser.DIVIDE }
  | '('             { Parser.LPAREN }
  | ')'             { Parser.RPAREN }
  | eof             { Parser.EOF }