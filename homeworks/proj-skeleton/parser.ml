(* throw this exception with a proper message if you meet a parsing error. *)
exception PARSE_ERROR of string

type token =
  | INT of int
  | ID of string
  | PLUS
  | MINUS
  | TIMES
  | LPAREN
  | RPAREN
  | TRUE
  | FALSE
  | NULL
  | IF
  | CONS
  | CAR
  | CDR
  | LAMBDA
  | LET
  | LETREC
  | EQ
  | LT
  | GT
  | MCONS
  | MCAR
  | MCDR
  | SETMCAR
  | SETMCDR
  | RAISE
  | HANDLERS
  | EOF

(* you can use this for debugging *)
let token_printer = function
  | INT n -> string_of_int n
  | ID id -> id
  | PLUS -> "+"
  | MINUS -> "-"
  | TIMES -> "*"
  | LPAREN -> "("
  | RPAREN -> ")"
  | TRUE -> "#t"
  | FALSE -> "#f"
  | NULL -> "'()"
  | IF -> "if"
  | CONS -> "cons"
  | CAR -> "car"
  | CDR -> "cdr"
  | LAMBDA -> "lambda"
  | LET -> "let"
  | LETREC -> "letrec"
  | EQ -> "="
  | LT -> "<"
  | GT -> ">"
  | MCONS -> "mcons"
  | MCAR -> "mcar"
  | MCDR -> "mcdr"
  | SETMCAR -> "set-mcar!"
  | SETMCDR -> "set-mcdr!"
  | RAISE -> "raise"
  | HANDLERS -> "with-handlers"
  | EOF -> "eof"


(* You can get a token by calling `lexer` function like this example: *)
(* let token = lexer () in ... *)

let parse (lexer: unit -> token): Syntax.exp_t =
  ...
