open CommonGrade
open Hw6_4

let _ = output (fun () ->
  (eval (IMPLY (ORELSE (FALSE, LESS (NUM 0, (PLUS (NUM (-1), NUM 0)))), FALSE))))

