# Lab Session, Principles of Programming #

20151102 (월) 16:00-17:50
TA 김윤승, 박상훈

## 값 중심 vs. 물건 중심 ##

강의시간에 *값 중심*과 *물건 중심* 프로그래밍에 대해 배우는데요, 이 시간에 각각을 실습해봅시다.

### Summation ###

0부터 `n`까지 모두 더하는 프로그램을 각 스타일로 정의해봅시다.

#### 값 중심 ####

아래의 함수는 값 중심 프로그래밍 스타일로 구현한 재귀함수입니다. 프로그램에 나오는 `n`은 **값**입니다: 담고 있는 내용은 변하지 않습니다.

```racket
(define (sum-a n)
  (if (equal? n 0)
      0
      (+ n (sum-a (- n 1)))))

(sum-a 10)
```

#### 물건 중심 ####

아래의 프로그램은 변수 `sum`이 존재합니다. 실행 중간에 변수가 담는 값이 여러 번 바뀔 수 있으며 마지막에는 우리가 원하는 값을 담게 됩니다.

```racket
(define sum 0)

(define (sum-i n)
  (if (equal? n 0) sum
      (begin 
        (set! sum (+ n sum))
        (sum-i (- n 1)))))

(sum-i 10)
```

아래의 함수는 Racket의 `for`를 사용하였습니다. [manual](http://docs.racket-lang.org/reference/for.html)을 참고하세요.

```racket
(set! sum 0)

(define (sum-i-for n)
  (for ((i (+ n 1)))
       (set! sum (+ sum i)))
  sum)

(sum-i-for 10)
```

#### 유한상태기계 (Finite state machine) ####

지난 번에 구현한 유한상태기계를 물건중심으로 구현해봅시다.

뼈대코드를 보시고: [skeleton code](fsm_imp.rkt) 지난번의 코드:
[previous week's skeleton code](../20141022/fsm.rkt) 와 비교해봅시다.

`step-fsm`과 `run-fsm` 를 구현해보세요.

## Environment and Memory ##

Environment는 변수와 location의 map입니다. Memory는 location과 value의 map입니다. 

![env-mem](fig-env-mem.png)

첫 번째 env에서, ```x``` 는 어떤 location을 가리키고 이 location은 값 ```1```을 가리킵니다.

세 번째 env에서, ```y``` 는 어떤 location을 가리키고 이 location은 (```cons```)를 가리킵니다.

