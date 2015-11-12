exception TODO

type pgm = cmd
and cmd = ASSIGN of exp
 | SEQUENCE of cmd * cmd
 | REPEAT of cmd
 | CHOICE of cmd * cmd
 | EQ of exp * cmd
 | NEQ of exp * cmd
and exp = NUM of int
 | ADD of exp * exp
 | SUB of exp * exp
 | VAR

type state = int

let rec exeval (p:pgm) (st:state): state list =
  raise TODO
