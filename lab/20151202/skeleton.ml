(* stack *)

module type StackSig = sig
  type t
  val empty: t
  val push: int -> t -> t
  val pop: t -> (int * t) option
end

module Stack : StackSig = struct
  type t = int list
  let empty = []
  let push x l = x::l
  let pop l =
    match l with
    | [] -> None
    | x::l -> Some (x, l)
end

let x = Stack.push 3 Stack.empty
(* let y = Stack.push 3 [] *)


(* key-value store *)

module type StoreSig = sig
  (* Note that `None` for option types means operation fails *)

  type conn

  val open_conn: string -> conn option
  val close_conn: conn -> unit option

  val put: string -> string -> conn -> conn option
  val get: string -> conn -> string option
end

module MockUpStore = struct
  exception TODO

  type conn = (string * string) list

  let open_conn uri = raise TODO
  let close_conn conn = raise TODO

  let put k v conn = raise TODO
  let get k conn = raise TODO
end

exception FAIL

let bind o f =
  match o with
  | None -> raise FAIL
  | Some x -> f x

let assertion b cont =
  if b
  then cont
  else raise FAIL

module MkStoreTest (Store:StoreSig) = struct
  let run () =
    bind (Store.open_conn "http://sf.snu.ac.kr/mock-up-store/") (fun conn1 ->
    bind (Store.put "key1" "value1" conn1) (fun conn2 ->
    bind (Store.put "key2" "value2" conn2) (fun conn3 ->
    bind (Store.get "key1" conn3) (fun value1 ->
    assertion (value1 = "value1") (
    bind (Store.get "key2" conn3) (fun value2 ->
    assertion (value2 = "value2") (
    bind (Store.put "key1" "value1'" conn3) (fun conn4 ->
    bind (Store.get "key1" conn4) (fun value1' ->
    assertion (value1' = "value1'") (
    let _ = print_endline "test passed." in
    ()))))))))))
end

module StoreTest = MkStoreTest (MockUpStore)
let _ = StoreTest.run ()
