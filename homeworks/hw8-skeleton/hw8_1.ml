module type Queue = 
sig
  type element
  type queue
  exception EMPTY_Q
  val emptyq: queue
  val enq: queue * element -> queue
  val deq: queue -> element * queue
end

module StringQ : Queue with type element = string = 
struct 
  ...
end

module StringQQ : Queue with type element = StringQ.queue = 
struct 
  ...
end
