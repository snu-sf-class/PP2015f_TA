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
* 보다 직관적인 에러메시지는 이렇겠지요: ```type error: (leaf-value t) is an int, but is expected to be a string.```

해결 방법은, static typing을 지원하는 언어를 사용하는 것입니다.
따라서, 우리는 OCaml을 사용하도록 하겠습니다.

### OCaml ###

[tree.ml](tree.ml) 파일을 [try.ocamlpro.com](http://try.ocamlpro.com) 이곳에 놓아보세요.

PC의 OCaml을 이용하셔도 상관없습니다.


```ocaml
type tree =
  | Leaf of int
  | Branch of (tree * tree);;
```

여기에서 새로운 타입 ```tree```를 정의하고 있습니다. Racket과 달리, 우리는 타입을 명시할 수 있습니다. ```tree``` 타입은 정수를 갖는 ```Leaf```와 두 개의 서브트리를 갖는 ```Branch```로 이루어져 있습니다.

```ocaml
let rec pprint_tree (t: tree): string =
  match t with
  | Leaf v -> string_of_int v
  | Branch (l, r) ->
     "(" ^ (pprint_tree l) ^ " " ^ (pprint_tree r) ^ ")";;
```

```match ??? with``` 가 가장 주목해야 할 부분입니다.
Racket에서 우리는 이 부분을 ```(if (is-branch? t) ??? ???)``` 이렇게 표현하였습니다.
OCaml에서는 ```match``` 를 이용해 서로 다른 케이스에 대해 다른 일을 하도록 할 수 있습니다.

또한, ```string_of_int```는 integer를 string으로 변환하는 역할을 하며, ```^```는 string을 연결(append)합니다.

```ocaml
let ex = Branch (Branch (Branch (Leaf 0, Leaf 1), Leaf 2), Branch (Leaf 3, Leaf 4));;
let _ = print_endline (pprint_tree ex);;
```

Ocaml은 몇 가지 장점을 갖고 있습니다.

* Racket보다 더 정확합니다.
* 실행 전에 모든 타입 에러를 찾아줍니다.
이 [treeWrong.ml](treeWrong.ml) 파일을 실행시켜보세요. 무언가 유용한 메시지를 얻을 수 있습니다: 
`File "treeWrong.ml",
line 7, characters 14-15: Error: This expression has type int but an
expression was expected of type string`


### Ocaml Programming ###

tree.ml을 숙지한 후, [list.ml](list.ml)을 완성시켜보세요.

### OCaml Development Environment ###

다음과 같은 OCaml 개발 환경을 사용하실 수 있습니다.

* 채점에 사용되는 OCaml 버전은 4.02입니다.
* [Download](http://caml.inria.fr/download.en.html) 
* 리눅스 사용자의 경우, Emacs/Vim + make를 사용하시면 됩니다.
  + Emacs 사용자의 경우, 유용한 플러그인을 소개합니다:
    [Tuareg](http://www.emacswiki.org/emacs/TuaregMode)
* 또한, [Eclipse](http://eclipse.org) +
  [OcaIDE](http://www.algo-prog.info/ocaide/) 역시 좋은 방법입니다.
