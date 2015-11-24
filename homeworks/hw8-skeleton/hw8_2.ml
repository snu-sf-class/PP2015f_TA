module type Queue = 
sig
  type element
  type queue
  exception EMPTY_Q
  val emptyq: queue
  val enq: queue * element -> queue
  val deq: queue -> element * queue
end

module StringSetQ : Queue with type element = string = 
struct 
  ...
end

module StringSetQQ : Queue with type element = StringSetQ.queue = 
struct 
  ...
end
