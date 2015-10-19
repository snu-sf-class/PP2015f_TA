# 프로그래밍의 원리: 실습 #

2015.10.19(월) 16:00-16:50 / 17:00-17:50

TA [김윤승](http://sf.snu.ac.kr/yoonseung.kim), [박상훈](http://sf.snu.ac.kr/sanghoon.park)

### 실습 안내 ###

* 실습실 컴퓨터에 개인 계정이 없으신 경우, id: pp2015로 로그인 가능합니다. 비밀번호는 실습 시간에 조교가 알려드립니다.
* 실습 내용을 설명해드린 후에는 실습에 참여하지 않으셔도 됩니다.
* 실습과 관련하여 모르는 내용은 언제든 질문해주시면 됩니다.

## 실습목표 ##

+ 데이터타입 구현
+ 데이터타입 내부의 정보 가리기

## 미분 (Differentiation) ##

수식을 미분해봅시다. 뼈대 코드는 [여기](differentiate.rkt)에 있습니다.

실습에서 구현할 내용은 아래와 같습니다.

+ constants,
+ variables,
+ additions,
+ subtractions, and
+ multiplications.

미분에 관한 정보는 [여기](http://en.wikipedia.org/wiki/Differentiation)에서 확인할 수 있습니다.

## 유한 상태 기계 (Finite State Machine) ##

어떤 자판기가 있다고 생각해봅시다.

+ 자판기에 동전을 넣습니다.
+ 만약 동전을 넣었고, "콜라(cola)" 라는 버튼을 눌렀다면, 자판기는 콜라를 줍니다.
+ 만약 동전을 넣었고, "사이다(cider)" 라는 버튼을 눌렀다면, 자판기는 사이다를 줍니다.
+ 동전을 넣었고, "반환(return)" 버튼을 눌렀다면 동전을 줍니다.
+ 동전을 넣었고, 또 다른 동전을 넣으면 동전을 돌려줍니다.

이러한 자판기를 수학적으로 표시해봅시다. 두 개의 상태를 생각해 볼 수 있습니다.

+ 동전이 들어와있지 않은 상태 (```initial```)
+ 동전이 들어와있는 상태 (```coined```)

우리는 이 자판기에 아래와 같은 입력을 줄 수 있습니다.

+ 동전을 넣는다 (```insert-coin```)
+ 콜라 버튼을 누른다 (```push-cola```)
+ 사이다 버튼을 누른다 (```push-cider```)
+ 반환 버튼을 누른다 (```push-return```)

자판기는 다음과 같은 것들을 줍니다.

+ 아무것도 주지 않는다 (```nothing```)
+ 동전 (```coin```)
+ 콜라 (```cola```)
+ 사이다 (```cider```)

이러한 자판기를 그림으로 표현하면 다음과 같습니다.

![fsm](fsm.png)

이러한 그림이 나타내는 것을 **유한 상태 기계 (finite state machine)**라 부릅니다. 이에 대한 자세한 정보는 [여기](http://en.wikipedia.org/wiki/Finite-state_machine)를 참고하세요.

이번 실습에서는 이러한 유한 상태 기계를 구현할 것입니다. 다음 함수들을 구현해보세요. 이 유한 상태 기계의 ```input```, ```output```, 그리고 ```state```는 모두 스트링입니다.

```racket
init-fsm: fsm
add-rule-fsm: state * input * state * output * fsm -> fsm
step-fsm: state * input * fsm -> state X output
run-fsm: state * input list * fsm -> state X output list
```

뼈대 코드는 [여기](fsm.rkt)에 있습니다. 자판기가 잘 동작하도록 구현해보세요.
