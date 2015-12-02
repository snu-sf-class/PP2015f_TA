# 프로그래밍의 원리: 실습 #

2015.12.2(수) 16:00-17:50

TA [김윤승](http://sf.snu.ac.kr/yoonseung.kim), [박상훈](http://sf.snu.ac.kr/sanghoon.park)

### 실습 안내 ###

* 실습실 컴퓨터에 개인 계정이 없으신 경우, id: pp2015로 로그인 가능합니다. 비밀번호는 실습 시간에 조교가 알려드립니다.
* 실습 내용을 설명해드린 후에는 실습에 참여하지 않으셔도 됩니다.
* 실습이나 과제와 관련하여 모르는 내용은 언제든 질문해주시면 됩니다.
 .

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
