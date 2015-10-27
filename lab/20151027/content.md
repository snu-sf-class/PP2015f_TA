# 프로그래밍의 원리: 실습 #

2015.10.28(수) 16:00-17:50

TA [김윤승](http://sf.snu.ac.kr/yoonseung.kim), [박상훈](http://sf.snu.ac.kr/sanghoon.park)

### 실습 안내 ###

* 실습실 컴퓨터에 개인 계정이 없으신 경우, id: pp2015로 로그인 가능합니다. 비밀번호는 실습 시간에 조교가 알려드립니다.
* 실습 내용을 설명해드린 후에는 실습에 참여하지 않으셔도 됩니다.
* 실습이나 과제와 관련하여 모르는 내용은 언제든 질문해주시면 됩니다.

## 계산기 ##

이번 실습시간에는 계산기를 구현해봅시다. 뼈대 코드[calculator.rkt](calculator.rkt)를 완성해보세요.

이 계산기에서는 다음과 같은 내용만 구현합니다.

- constants,
- varables,
- additions,
- subtractions, and
- multiplications.

계산기의 입력 값은 다음과 같습니다:
- 수식
- 변수들의 값을 나타내는 리스트 (뼈대코드의 env)

좀 더 구체적인 내용은 뼈대 코드를 참고하시면 됩니다.

## 복소수 (Complex numbers) ##

"복소수" 라는 데이터 타입을 구현해봅시다. 뼈대 코드[complex.rkt](complex.rkt)를 완성해보세요.

이번 실습에서는 다음의 두 가지 표현방법으로 복소수를 구현합니다:

- 데카르트 좌표계 (Descartes coordinate system): 좌표 평면에서와 같이  ```(x, y)``` 형태로 표현됩니다.
- 극좌표계 (Polar coordinate system): ```(r, θ)``` 는 길이 ```r``` 과 각도  ```θ``` 를 의미합니다.

두 표현방법 모두  ```real X real```로 표시됩니다. 따라서 다음과 같이 심볼을 사용하여 구분합시다.

- ```(cons 'rect (cons 1 pi))``` 는 데카르트 좌표계에서의 ```(1, pi)``` 를 의미합니다.
- 또한 ```(cons 'polar (cons 1 pi))``` 는 극좌표계에서의 ```(1, pi)``` 를 의미합니다. 이는 데카르트 좌표계에서의 ```(-1,0)```와 동일합니다.

복소수에 관하여 모르는 부분이 있다면 아래 위키를 참고하시면 됩니다.

- [Complex number](http://ko.wikipedia.org/wiki/Complex_number)
- [Polar coordinate system](http://ko.wikipedia.org/wiki/Polar_coordinate_system)


### Challenge ###

언젠가 과제로 등장할지도 모르는 [Turing machine](http://en.wikipedia.org/wiki/Turing_machine) ([Korean](http://ko.wikipedia.org/wiki/%ED%8A%9C%EB%A7%81_%EA%B8%B0%EA%B3%84))을 어떻게 구현할 수 있을지 생각해봅시다.
