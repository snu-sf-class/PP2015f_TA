# 프로그래밍 원리 실습 #

## Termination of Program ##

아래의 함수 `fac`은 팩토리얼을 계산하는 함수이고, 언제나 멈춥니다:
```racket
(define (fac n) 
   (printf "~s~n" n)
   (if (= n 0) 1 (* n (fac (- n 1)))))
```

팩토리얼 함수가 실제로 줄어드는지 확인하기 위해,
```printf```로 *줄어드는 숫자*를 출력해 보았습니다.
줄어드는 숫자는 다음 두 가지 조건을 만족해야 합니다.

- 매 실행마다 반드시 줄어들어야 합니다.
- 값은 언제나 0 이상이어야 합니다.

아래의 `my-gcd` 함수도 언제나 멈춥니다. 이것을 확인하기 위해, `TODO`를 채워보세요.
이 함수의 입력은 언제나 0 이상이라고 가정하세요.

```racket
(define (my-gcd n m)
  (printf "~s~n" 'TODO)
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my-gcd n (- m n)))
        (else (my-gcd (- n m) m))))
```

(Solution: (+ n m))

## How to troubleshoot? ##

오늘은 약간 다른 얘기를 해볼까 합니다. 이 과목 뿐만 아니라 이후 어떤 상황에서도
프로그래밍 중 여러분이 맞닥뜨릴 문제들을 어떻게 해결할 지에 관한 내용입니다.

### Audience ###
- Those who suffered from not knowing how to implement something for
  overnight. For example, you may want to know how to convert integer
  into string.
- Those who suffered from wrong answer for overnight.
- Those who suffered from Principles of Programming (..)

This guide does not aim to resolve all your problems, but to resolve
your problems generally related to languages. I hope this really helps
you.

### Implementation Scenario ###
`acc`라는 함수를 정의하여 `1`부터 `n`까지의 숫자를 다 연결하는 문자열을 만들고 싶다고 합시다:
```racket
(equal? "1234567891011" (acc 11))
```

다음과 같이 `acc`을 설계하였습니다:
```racket
(define (acc n)
  (if (equal? n 0) ""
      'TODO))
```

이제, `TODO`에 `(acc (- n 1))`과 `n`을 연결하는 코드를 채우면 되겠죠.
하지만 타입이 맞지 않습니다. 앞의 것은 문자열(string)인데 `n`은 숫자(integer)이죠.
결과는 string이 되어야 하므로 결국 integer를 string으로 변환하는 방법이 필요합니다.
하지만 누가 가르쳐 준 적이 없는데, 어떻게 하죠? Racket 매뉴얼을 다 읽어봐야 할까요?

당황하지 마시고, 그냥 Google에 적당한 키워드를 검색해보세요.
["racket convert from integer to string"](https://www.google.com/?q=racket%20convert%20from%20integer%20to%20string).
첫 번째 결과는 이 페이지입니다.
[racket documentation on string](http://docs.racket-lang.org/reference/strings.html).

이제 여러분이 원하는 함수를 정확히 찾아내었습니다. 이제 문제 상황은 아래와 같이 변하였습니다.
```racket
(define (acc n)
  (if (equal? n 0) ""
      ('TODO (acc (- n 1)) (number->string n))))
```

이제 두 string을 연결하는 방법만 알아내면 됩니다. string간의 연결을 컴퓨터공학에선 *concatenate* 또는 *append*라고 합니다. 이제 구글에 다음과 같이 쳐보세요.
["racket concatenate strings"](https://www.google.co.kr/search?q=racket+concatenate+strings).
역시 첫 번째 페이지가 아래와 같이 나오네요.
[racket documentation on string](http://docs.racket-lang.org/reference/strings.html).
우리가 원하는 함수 "string-append"를 정확히 찾았습니다. 이제 아래와 같이 문제를 풀 수 있겠죠?
```racket
(define (acc n)
  (if (equal? n 0) ""
      (string-append (acc (- n 1)) (number->string n))))
```

### Error Message Scenario - 버그 찾는 법 ###
여러분이 아래와 같이 문제를 풀었다고 해봅시다.
```racket
(define (acc n)
  (if (equal? n 0) ""
      (cons (acc (- n 1)) (number->string n))))
```

그러면 `(acc 11)`의 결과는 아래처럼 됩니다:
```racket
'((((((((((("" . "1") . "2") . "3")
         .
         "4")
        .
        "5")
       .
       "6")
      .
      "7")
     .
     "8")
    .
    "9")
   .
   "10")
  .
  "11")
```
이게 어떻게 된 일일까요?? (답을 알아도 여기선 일단 모른 척 합시다!)

우선, `11` 은 너무 큽니다. 작은 입력부터 체크합시다: `(acc 0)`.
결과는 `""`, 우리가 원하던 결과입니다. 그러면 이제 `(acc 1)`를 테스트합시다.
결과는 다음과 같이 나오네요: `'("" . "1")`, 우리가 원하는 게 아닙니다!
*Lesson: 가장 작은 예제를 찾아라.*

이제 무슨 일이 일어나는 지 봅시다. `acc`는 재귀함수입니다. `(acc 1)`을 분석하기 위해 `n`을 `1`로 바꿔보세요.

```racket
(if (equal? 1 0) ""
    (cons (acc (- 1 1)) (number->string 1)))
```
더욱 간단히 해봅시다. `1`은 `0`과 다르므로, 위 코드는 아래와 동등한 의미를 가집니다.
```racket
(cons (acc (- 1 1)) (number->string 1))
```
`(acc 0)`의 실행 결과는 우리가 이미 알고있죠.
```racket
(cons "" "1")
```
이제 확실해졌습니다. 우리는 ""과 "1"을 string으로 연결해야 하는데 `cons`를 써서 pair로 만들어버렸네요.
`string-append`로 바꿔주면 버그를 해결할 수 있습니다.
*Lesson: 문제를 해결하기 위해, 작은 예제 위에서 구체적으로 생각하기.*

### Lessons Learned ###
- 뭔가를 하는 방법을 모를 때:
    + 구글에 검색합니다.
    + 좋은 검색 결과를 얻으려면, 질문을 잘 만들어야 합니다.
        * 영어를 잘 알아야.. 합니다
        * Computer science에서 주로 어떤 질문들이 흔하게 나오는지 감을 잡아야..
- 뭔가를 했는데 결과가 틀릴 때:
    + 구글에 검색할 수 있는 상황이면, 하세요 (에러메시지 등).
    + 문제 상황의 핵심을 찾으세요 (문제가 일어나는 가장 작은 예를 찾기).
    + 실행 과정을 구체적으로 생각해보세요.
- 만약 Racket에 충분히 익숙하지 않아 이 예제들을 따라가기 힘들다면, 우선 Racket을 공부해야 합니다. 실습 자료를 처음부터 읽고 다시 따라해보세요.
