# Lab Session, Principles of Programming #

20141203 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/~jeehoon.kang),
[Yoonseung Kim](http://sf.snu.ac.kr/~yoonseung.kim)

We will implement a key-value store interface, a mock-up implementation, and a tester.

## Concept: Module and Information Hiding #

A purpose of OCaml `module` is to hide implementation details from interface, _i.e._, you want to *expose what* it implements, but *hide how* to implement it. Let's see the integer stack example. A stack has three methods: `empty`, `push`, `pop`. This idea on interface is represented as a module type as follows:
```
module type StackSig = sig
  type t
  val empty: t
  val push: int -> t -> t
  val pop: t -> (int * t) option
end
```

Here is a module implementation that satisfies `StackSig`:
```
module Stack : StackSig = struct
  type t = int list
  let empty = []
  let push x l = x::l
  let pop l =
    match l with
    | [] -> None
    | x::l -> Some (x, l)
end
```

Note that `module Stack : StackSig` part hides all the information except what `StackSig` says. To see this, see the following code snippet:
```
let x = Stack.push 3 Stack.empty
let y = Stack.push 3 []
```
`x` is properly type-checked and compiled, while `y` is not. This is because `Stack` no longer exposes the information that `t = int list`, thanks to `StackSig`.

## Example: Key-Value Store ##

Fill in the [skeleton](skeleton.ml).

You may find this command helpful:
```ocamlc -g skeleton.ml && OCAMLRUNPARAM=b ./a.out```
This will show you where a exception is raised, if it is the case.
