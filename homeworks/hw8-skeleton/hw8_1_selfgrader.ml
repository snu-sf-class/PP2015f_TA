open CommonGrade
open Hw8_1

let _ = print_endline "StringQ"

let rec queue2list (q:StringQ.queue) : string list =
  try let (e,r) = StringQ.deq q in
      e::(queue2list r)
  with StringQ.EMPTY_Q -> []

let abc_queue = 
  StringQ.enq (StringQ.enq (StringQ.enq (StringQ.emptyq, "a"), "b"), "c")
let _ = output (fun () -> queue2list abc_queue = ["a";"b";"c"])

let (a,bc_queue) = StringQ.deq abc_queue
let _ = output (fun () -> a = "a")
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])

let bcb_queue = StringQ.enq (bc_queue, "b")
let _ = output (fun () -> queue2list bcb_queue = ["b";"c";"b"])

let (b,cb_queue) = StringQ.deq bcb_queue
let _ = output (fun () -> b = "b")
let _ = output (fun () -> queue2list cb_queue = ["c";"b"])

let (c,b_queue) = StringQ.deq cb_queue
let _ = output (fun () -> c = "c")
let _ = output (fun () -> queue2list b_queue = ["b"])

let (b,empty_queue) = StringQ.deq b_queue
let _ = output (fun () -> b = "b")
let _ = output (fun () -> queue2list empty_queue = [])


let _ = print_endline "StringQQ"

let rec qqueue2list (qq:StringQQ.queue) : (string list) list =
  try let (e,r) = StringQQ.deq qq in
      (queue2list e)::(qqueue2list r)
  with StringQQ.EMPTY_Q -> []

let abc_bc_bcb_qqueue = 
  StringQQ.enq (StringQQ.enq (StringQQ.enq (StringQQ.emptyq, abc_queue), bc_queue), bcb_queue)
let _ = output (fun () -> 
  qqueue2list abc_bc_bcb_qqueue = [["a";"b";"c"];["b";"c"];["b";"c";"b"]]
)

let (abc_queue,bc_bcb_qqueue) = StringQQ.deq abc_bc_bcb_qqueue
let _ = output (fun () -> queue2list abc_queue = ["a";"b";"c"])
let _ = output (fun () -> qqueue2list bc_bcb_qqueue = [["b";"c"];["b";"c";"b"]])

let bc_bcb_bc_qqueue = StringQQ.enq (bc_bcb_qqueue, bc_queue)
let _ = output (fun () -> 
  qqueue2list bc_bcb_bc_qqueue = [["b";"c"];["b";"c";"b"];["b";"c"]]
)

let (bc_queue,bcb_bc_qqueue) = StringQQ.deq bc_bcb_bc_qqueue
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])
let _ = output (fun () -> qqueue2list bcb_bc_qqueue = [["b";"c";"b"];["b";"c"]])

let (bcb_queue,bc_qqueue) = StringQQ.deq bcb_bc_qqueue
let _ = output (fun () -> queue2list bcb_queue = ["b";"c";"b"])
let _ = output (fun () -> qqueue2list bc_qqueue = [["b";"c"]])

let (bc_queue,empty_qqueue) = StringQQ.deq bc_qqueue
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])
let _ = output (fun () -> qqueue2list empty_qqueue = [])
