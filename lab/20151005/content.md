# 프로그래밍의 원리: 실습 #

20151005(월) 16:00-17:00 / 17:00-18:00

TA [김윤승](http://sf.snu.ac.kr/yoonseung.kim), [박상훈](http://sf.snu.ac.kr/sanghoon.park)

### 실습 안내 ###

* 실습실 컴퓨터에 개인 계정이 없으신 경우, id: pp2015로 로그인 가능합니다. 비밀>번호는 실습 시간에 조교가 알려드립니다.
* 실습 내용을 설명해드린 후에는 실습에 참여하지 않으셔도 됩니다.
* 실습과 관련하여 모르는 내용은 언제든 질문해주시면 됩니다.

이번 실습에서는 이미 만들어진  뼈대 코드 ([skeleton.rkt](skeleton.rkt))를 활용합니다.

## (이어서) 고차함수 ##
`circ`, `flip`, `map`, `reduceLeft`, `reduceRight`, `filter`를 구현해 봅시다.
- `circ` is the composition of functions, i.e., `((circ g f) x) = (g (f x))`.
- `flip` reorders its arguments, i.e., `((flip f) x y) = (f y x)`.
- `map` transforms each element of a list, i.e., `(map f (list a b c)) = (list (f a) (f b) (f c))`.
- `reduceLeft` reduces the list from the left, i.e., `(reduceLeft r i (list a b c)) = (r (r (r i a) b) c)`.
- `reduceRight` reduces the list from the right, i.e., `(reduceRight r (list a b c)) i = (r a (r b (r c i)))`.
- `filter` filters by a test function, i.e., `(filter test (list a b c)) = (list a c)`, if `(test a)` and `(test c)` are `#t` but `(test b)` is `#f`.

## 타입 (Type) ##
- 타입은 어떤 값에 대해 *특정한 형식을 지정*하는 방법입니다. 예를 들면,
	+ `int`는 정수를 의미합니다.
	+ `int -> bool`은 정수(`int`)를 인자로 받아, boolean(`bool`)값을 돌려주는 함수(->)입니다.
	+ `(int*bool) -> string`은 정수(`int`)와 boolean(`bool`)을 인자로 받아, 스트링(`string`)을 돌려주는 함수(`->`)입니다.
- 어떤 정보의 경우는 타입에서 드러나지 않습니다. 예를 들어 "어떤 숫자 `x`를 받아서 `2*x`를 돌려주는 함수 `f`"를 정의하는 경우, 돌려주는 값에 대한 구체적인 정보는 타입에서 드러나지 않습니다.
- 어떤 함수를 구현할 때, 우선 함수의 타입이 어떻게 될 것인지를 생각해야 합니다. 이를 통해 보다 자신의 의도에 부합하는 함수를 만들기 쉬워질 것입니다.
- 다른 사람이나 자신이 오래 전에 구현한 함수를 읽을 때에도, 우선 함수의 타입이 무엇인지를 파악해야 합니다. 이는 함수의 기능을 이해하는 데 도움을 줄 것입니다.

### Examples ###
```racket
(define x 1) ; int
(define y "Jessica") ; string
(define (z x) (string-append "SM and " x)) ; string -> string
(define w (z y)) ; string
(define (a x y) (+ (* x 3) y)) ; int * int -> int
(define (id x) x) ; X -> X
```

### Exercises ###
- [skeleton.rkt](skeleton.rkt)에 있는 함수들의 타입을 이해해 보세요.
