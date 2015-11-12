open CommonGrade
open Hw6_3

let _ = output (fun () ->
  (drop (NODE (NODE (NODE (LEAF Korea, LEAF France), LEAF Brazil), LEAF England)) England) =
  "((Korea France) Brazil)")

