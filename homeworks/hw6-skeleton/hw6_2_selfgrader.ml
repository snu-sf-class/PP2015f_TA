open CommonGrade
open Hw6_2

let _ = output (fun () -> 
  (parenize (NODE (NODE (NODE (LEAF Korea, LEAF France), LEAF Brazil), LEAF England))) = "(((Korea France) Brazil) England)")

