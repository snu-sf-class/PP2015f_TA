open CommonGrade
open Hw6_7

let p1 = 
  SEQUENCE (ASSIGN (NUM 1),
	    REPEAT
	      (CHOICE (EQ (NUM 1, ASSIGN (ADD (VAR,NUM 1))),
		       NEQ (NUM 1, ASSIGN (SUB (VAR,NUM 1))))
	   ))

let p2 = REPEAT (ASSIGN (ADD (VAR,NUM 1)))

let _ = output (fun () -> (exeval p1 (-1)) = [1; 2])

let _ = output (fun () -> (exeval p2 1) = [1; 2; 3; 4; 5])
