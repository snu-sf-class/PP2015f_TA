# 프로그래밍 원리 실습 #

20151109 (월) 16:00-16:50
TA 김윤승, 박상훈

## Environment와 Memory, Revisited ##

Environment는 변수에서 location으로 가는 map이고, Memory는 location에서 값으로 가는 map입니다. 


![env-mem](fig-env-mem.png)

첫 번째 environment에서 `x`는 메모리 상의 어떤 위치(location)를 가리키는데 그 위치는 1을 저장하고 있습니다.

세 번째 environment에서 `y`는 어떤 메모리 location을 가리키는데, 그 location에는 pair가 저장되어 있어, 앞 부분 (`car`)에는 2가 저장된 location을, 뒷부분(`cdr`)에는 또 다른 pair가 저장된 location을 가리키고 있습니다.

네 번째 environment의 `x`와 같이, 메모리의 같은 location을 다른 변수가 가리킬 수도 있습니다.

### Counter ###

environment와 memory에 대해 배웠으므로, 이제 예제를 살펴봅시다. [Counter](counter.rkt).

```create-counter``` 는 한 함수를 내놓는데, 이 함수는 실행될 때마다 `n`의 값을 1씩 증가시키고 돌려줍니다. `create-counter`를 통해 `c`가 정의된 이후의 environment와 memory는 다음 그림과 같습니다.

* 함수는 메모리에 저장된 값이며, 또한 environment를 가리키고 있습니다 *

![env1](env1.png)

`d`가 정의된 후의 environment와 memory는 다음과 같습니다.

![env2](env2.png)

이제 counter의 실행 과정을 이해할 수 있겠죠?
```c``` 와 ```d```가 가진 environment는 ```n```이 서로 다른 location을 가리키고 있으므로 따로 동작합니다.

## Mutable Lists ##

이 [문서](http://docs.racket-lang.org/reference/mpairs.html)를 보고 여러 가지를 실험해보세요.
