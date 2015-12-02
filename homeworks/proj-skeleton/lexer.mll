(* File lexer.mll *)
        {
        open Parser        (* The type token is defined in parser.mli *)
        }
        rule token = parse
            [' ' '\t' '\n']     { token lexbuf }     (* skip blanks *)
          | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
          | '+'            { PLUS }
          | '-'            { MINUS }
          | '*'            { TIMES }
          | '('            { LPAREN }
          | ')'            { RPAREN }
	  | "#t"	   { TRUE }
	  | "#f" 	   { FALSE }
	  | "'()"	   { NULL }
	  | "if" 	   { IF }
	  | "cons" 	   { CONS }
	  | "car" 	   { CAR }
	  | "cdr"	   { CDR }
	  | "lambda" 	   { LAMBDA }
	  | "let"	   { LET }
	  | "letrec"	   { LETREC }
	  | '='		   { EQ }
	  | '<'		   { LT }
	  | '>'		   { GT }
	  | "mcons"	   { MCONS }
	  | "mcar"	   { MCAR }
	  | "mcdr"	   { MCDR }
	  | "set-mcar!"	   { SETMCAR }
	  | "set-mcdr!"	   { SETMCDR }
	  | "raise"	   { RAISE }
	  | "with-handlers" { HANDLERS }
	  | ['a'-'z' 'A'-'Z' '-' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '-' '_']* as lxm	{ ID(lxm) }
	  | eof	     { EOF }