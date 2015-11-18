# 프로그래밍의 원리: 실습 #

2015.11.18(수) 16:00-17:50

TA [김윤승](http://sf.snu.ac.kr/yoonseung.kim), [박상훈](http://sf.snu.ac.kr/sanghoon.park)

### 실습 안내 ###

* 실습실 컴퓨터에 개인 계정이 없으신 경우, id: pp2015로 로그인 가능합니다. 비밀번호는 실습 시간에 조교가 알려드립니다.
* 실습 내용을 설명해드린 후에는 실습에 참여하지 않으셔도 됩니다.
* 실습이나 과제와 관련하여 모르는 내용은 언제든 질문해주시면 됩니다.
 

### 타입 에러 ###

우선 [treeWrong.rkt](treeWrong.rkt) 예제를 살펴보세요.
이 파일은 정수가 잎사귀들에만 저장되어 있는 이진 트리 구조를 나타냅니다.

하지만 이 코드를 실행하면, 다음과 같은 에러가 발생합니다:

```
string-append: contract violation
  expected: string?
  given: 0
  argument position: 2nd
  other arguments...:
   "("
   " "
   1
   ")"
  context...:
   /Users/idiothinker/Works/pp-material/20131106/treeWrong.rkt: [running body]
```

이 에러는, 스트링이 있어야 할 자리에 ```0```이 있다는 에러입니다. 이 코드가 잘 동작하도록 수정해보세요.
(Hint: 문제가 되는 지점은 35번째 라인의 ```(leaf-value t)``` 부분입니다.)


### Static Typing ###

위의 예제를 통해, 우리는 Racket 언어에 불편한 점이 있다는 것을 알 수 있습니다.

* 이러한 종류의 에러는 너무나 명확합니다.
* ```pprint-tree```는 반드시 ```string```을 리턴해야 하는데, 명백하게 ```(leaf-value t)``` 는 스트링이 아닙니다.
* 이러한 에러메시지가 발생한다면 좀 더 직관적일 것입니다: 
     ```type error: (leaf-value t) is an int, but is expected to be a string.```

The solution is, to use a language which supports static typing!
So we are going to use OCaml.

### OCaml ###

Download [tree.ml](tree.ml)
and drag-and-drop the file into
[try.ocamlpro.com](http://try.ocamlpro.com).

Or, you can use OCaml in your PC.

Let's look at the code line by line.

```ocaml
type tree =
  | Leaf of int
  | Branch of (tree * tree);;
```

This defines a new type ```tree```. Unlike Racket, we can define
types explicitly, and we should do it. the ```tree``` type consists
of two kinds, ```Leaf``` (which contains an integer) and ```Branch```
(which contains two subtrees).


```ocaml
let rec pprint_tree (t: tree): string =
  match t with
  | Leaf v -> string_of_int v
  | Branch (l, r) ->
     "(" ^ (pprint_tree l) ^ " " ^ (pprint_tree r) ^ ")";;
```

```match ??? with``` is the most important part.
In Racket we did like ```(if (is-branch? t) ??? ???)```.
In OCaml, we use ```match``` when we want to do different jobs
for different cases.

Other than that, we can see ```string_of_int``` changes an integer to string,
and ```^``` appends strings.

```ocaml
let ex = Branch (Branch (Branch (Leaf 0, Leaf 1), Leaf 2), Branch (Leaf 3, Leaf 4));;
let _ = print_endline (pprint_tree ex);;
```

Ocaml has several advantages.

* The code is more concise than Racket.
* It finds out all type errors before execution.
Try execute [treeWrong.ml](treeWrong.ml). You will see a helpful message like: 
`File "treeWrong.ml",
line 7, characters 14-15: Error: This expression has type int but an
expression was expected of type string`

### Ocaml Programming ###

After studying tree.ml, complete [list.ml](list.ml).

### OCaml Development Environment ###

We recommend the following environments.

* We will grade code with OCaml version 4.01.
* [Download](http://caml.inria.fr/download.en.html) 
* For Linux Users, Emacs/Vim + make will be good.
  + There is a useful plugin for Emacs
    [Tuareg](http://www.emacswiki.org/emacs/TuaregMode)
* Otherwise, [Eclipse](http://eclipse.org) +
  [OcaIDE](http://www.algo-prog.info/ocaide/) is good.
  If you want to use this, consult with the
  [previous ocaml tutorial](http://ropas.snu.ac.kr/~ta/4190.210/12/practice/ocaml_tutorial.pdf).
