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

The function below uses the `for` statement of the racket language.
Please refer to the
[manual](http://docs.racket-lang.org/reference/for.html) for more
deatils.

```racket
(set! sum 0)

(define (sum-i-for n)
  (for ((i (+ n 1)))
       (set! sum (+ sum i)))
  sum)

(sum-i-for 10)
```

#### Finite state machine ####

Let's re-implement the finite state machine we did in the previous
weeks with the imperative programming style.

See the [skeleton code](fsm_imp.rkt).  Compare it with the
[previous week's skeleton code](../20141022/fsm.rkt).

Complete the functions `step-fsm` and `run-fsm` that execute the
finite state machine. Note that:

- `fsm` and `state` represent a finite state machine and its state,
respectively.  They are some **states**, not **values**, which means
that their contents can be changed when some functions are executed.

- The finite state machine has a type `((state X input) X (state X
output)) list`.

- The execution of `step-fsm`: (1) traversing all rules of the finite
state machine, it records the next state and output to `state` and
`output` using the input state(`input-state`) and the input
value(`input`); (2) after the traversing it ouputs `output`.

- The execution of `run-fsm`: (1) traversing all inputs in `inputs`,
it executes `step-fsm`.  At that time, the output that is return of
`step-fsm` is recorded to `output-list`; (2) after the traversing it
outputs `output-list`.

## Environment and Memory ##

Environment is a map from variables to locations. Memory is a map from locations to values. For example (from Professor's slide 3),

![env-mem](fig-env-mem.png)

in the first environment, ```x``` points to a location and the
location points to tha value ```1```. Similary for ```y``` to ```2```.

In the third environment, ```y``` points to a location, and the
location points to a pair(```cons```), first(```car```) of which
points to 2 and second(```cdr```) of which points to a location of
another pair. In the picture, you can see ```x``` in the fourth
environment points to the same location.

### Counter ###

As you learned environment and memory in class and reviewed in lab
session, let's see an example: [Counter](counter.rkt).

```create-counter``` outputs a function. The function increases
internally stored ```n``` and returns it. After ```c``` is defined,
the environment and the memory look like as follows. Note that the
current environment is pin-pointed. Also note that when a
function(```c```) becomes a value, the current environment is stored
in the function value.

![env1](env1.png)

After ```d``` is defined, the environment and the memory look like as
follows.

![env2](env2.png)

Now you may understand why program runs as commented. Functions
```c``` and ```d``` assigns different locations to ```n```, so they
operate separately.
