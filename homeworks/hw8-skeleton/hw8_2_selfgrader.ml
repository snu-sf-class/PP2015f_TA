open CommonGrade
open Hw8_2

let _ = print_endline "StringSetQ"

let rec queue2list (q:StringSetQ.queue) : string list =
  try let (e,r) = StringSetQ.deq q in
      e::(queue2list r)
  with StringSetQ.EMPTY_Q -> []

let abc_queue = 
  StringSetQ.enq (StringSetQ.enq (StringSetQ.enq (StringSetQ.emptyq, "a"), "b"), "c")
let _ = output (fun () -> queue2list abc_queue = ["a";"b";"c"])

let (a,bc_queue) = StringSetQ.deq abc_queue
let _ = output (fun () -> a = "a")
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])

let bc_queue = StringSetQ.enq (bc_queue, "b")
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])

let (b,c_queue) = StringSetQ.deq bc_queue
let _ = output (fun () -> b = "b")
let _ = output (fun () -> queue2list c_queue = ["c"])

let (c,empty_queue) = StringSetQ.deq c_queue
let _ = output (fun () -> c = "c")
let _ = output (fun () -> queue2list empty_queue = [])


let _ = print_endline "StringSetQQ"

let rec qqueue2list (qq:StringSetQQ.queue) : (string list) list =
  try let (e,r) = StringSetQQ.deq qq in
      (queue2list e)::(qqueue2list r)
  with StringSetQQ.EMPTY_Q -> []

let abc_bc_c_qqueue = 
  StringSetQQ.enq (StringSetQQ.enq (StringSetQQ.enq (StringSetQQ.emptyq, abc_queue), bc_queue), c_queue)
let _ = output (fun () -> 
  qqueue2list abc_bc_c_qqueue = [["a";"b";"c"];["b";"c"];["c"]]
)

let (abc_queue,bc_c_qqueue) = StringSetQQ.deq abc_bc_c_qqueue
let _ = output (fun () -> queue2list abc_queue = ["a";"b";"c"])
let _ = output (fun () -> qqueue2list bc_c_qqueue = [["b";"c"];["c"]])

let bc_queue = 
  StringSetQ.enq 
    (snd
       (StringSetQ.deq
          (StringSetQ.enq
             (StringSetQ.enq
                (StringSetQ.emptyq, "a"), "b"))), "c")

let bc_c_qqueue = StringSetQQ.enq (bc_c_qqueue, bc_queue)
let _ = output (fun () -> 
  qqueue2list bc_c_qqueue = [["b";"c"];["c"]]
)

let (bc_queue,c_qqueue) = StringSetQQ.deq bc_c_qqueue
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])
let _ = output (fun () -> qqueue2list c_qqueue = [["c"]])

let (c_queue,empty_qqueue) = StringSetQQ.deq c_qqueue
let _ = output (fun () -> queue2list c_queue = ["c"])
let _ = output (fun () -> qqueue2list empty_qqueue = [])

