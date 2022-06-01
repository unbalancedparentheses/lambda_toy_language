%{
%}

/* Lexemes */
%token <int> NUMERAL
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN
%token EOL

/* Precedence and associativity */
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */

/* Top level rule */
%start main             /* the entry point */
%type <Syntax.expression> main

%%

/* Grammar */
main: e = expression EOL
  { e }
;

expression:
  | n = NUMERAL                             { Syntax.Numeral n }
  | e1 = expression TIMES  e2 = expression  { Syntax.Times (e1, e2) }
  | e1 = expression PLUS   e2 = expression  { Syntax.Plus (e1, e2) }
  | e1 = expression MINUS  e2 = expression  { Syntax.Minus (e1, e2) }
  | e1 = expression DIVIDE e2 = expression  { Syntax.Divide (e1, e2) }
  | MINUS e = expression %prec UMINUS       { Syntax.Negate e }
  | LPAREN e = expression RPAREN            { e }
;