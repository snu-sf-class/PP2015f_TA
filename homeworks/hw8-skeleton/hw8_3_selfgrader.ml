open CommonGrade
open Hw8_3

let _ = print_endline "StringQ"

module StringArg = 
struct
  type t = string
  let is_eq (x:t) (y:t) : bool = x = y
end
  
module StringQ = QueueMake (StringArg)

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
let (b,empty_queue) = StringQ.deq b_queue
let _ = output (fun () -> c = "c")
let _ = output (fun () -> queue2list empty_queue = [])

let _ = print_endline "StringQQ"

let c_queue = StringQ.enq (StringQ.emptyq,"c")

module StringQArg =
struct 
  type t = StringQ.queue
  let is_eq (x:t) (y:t) : bool = queue2list x = queue2list y
end

module StringQQ = QueueMake (StringQArg)

let rec qqueue2list (qq:StringQQ.queue) : (string list) list =
  try let (e,r) = StringQQ.deq qq in
      (queue2list e)::(qqueue2list r)
  with StringQQ.EMPTY_Q -> []

let abc_bc_c_qqueue = 
  StringQQ.enq (StringQQ.enq (StringQQ.enq (StringQQ.emptyq, abc_queue), bc_queue), c_queue)
let _ = output (fun () -> 
  qqueue2list abc_bc_c_qqueue = [["a";"b";"c"];["b";"c"];["c"]]
)

let (abc_queue,bc_c_qqueue) = StringQQ.deq abc_bc_c_qqueue
let _ = output (fun () -> queue2list abc_queue = ["a";"b";"c"])
let _ = output (fun () -> qqueue2list bc_c_qqueue = [["b";"c"];["c"]])

let bc_queue = 
  StringQ.enq 
    (snd
       (StringQ.deq
          (StringQ.enq
             (StringQ.enq
                (StringQ.emptyq, "a"), "b"))), "c")

let bc_c_bc_qqueue = StringQQ.enq (bc_c_qqueue, bc_queue)
let _ = output (fun () -> 
  qqueue2list bc_c_bc_qqueue = [["b";"c"];["c"];["b";"c"]]
)

let (bc_queue,c_qqueue) = StringQQ.deq bc_c_qqueue
let _ = output (fun () -> queue2list bc_queue = ["b";"c"])
let _ = output (fun () -> qqueue2list c_qqueue = [["c"]])

let (c_queue,empty_qqueue) = StringQQ.deq c_qqueue
let _ = output (fun () -> queue2list c_queue = ["c"])
let _ = output (fun () -> qqueue2list empty_qqueue = [])
