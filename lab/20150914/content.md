# 프로그래밍의 원리: 실습 #

20150914(월) 16:00-17:00 / 17:00-18:00

TA [김윤승](http://sf.snu.ac.kr/yoonseung.kim), [박상훈](http://sf.snu.ac.kr/sanghoon.park)

## 공지 ##

### 실습 안내 ###

* 실습실 컴퓨터에 개인 계정이 없으신 경우, id: pp2015로 로그인 가능합니다. 비밀번호는 실습 시간에 조교가 알려드립니다.
* 실습 내용을 설명해드린 후에는 실습에 참여하지 않으셔도 됩니다.
* 실습과 관련하여 모르는 내용은 언제든 질문해주시면 됩니다.

## 실습 내용 ##

숙제 1에 필요한 기본 내용으로 구성

### Racket 기초 ###

#### 값 (Value) ####

* Numbers
```racket
1
```

* Strings
```racket
"Principles of Programming"
```

* Symbols
```racket
'hur
'yoon
'hoon
```

* Pairs
```racket
(cons 2 3)
```

* Lists
```racket
'(1 2 3 4 5)
```

* Procedures
```racket
(lambda (x) (+ x 1))
```

#### 수식 (Expression) ####

```racket
(+ -1 2)
```

```racket
(string-append "Principles " "of " "Programming")
```

```racket
(cons (+ 1 1) (+ 1 2))
```

```racket
(append '(1 2) '(3 4 5))
```

```racket
((lambda (f) f) (lambda (x) (+ x 1)))
```

또 다른 수식들:

```racket
if, equal?, or, and, +, -, *, /, <, quotient, remainder, ...
```

```racket
(if (equal? 1 2) "X" "O")
```

```racket
(if (equal? 'z 'z) "O" "X")
```

```racket
(if (or (equal? 1 2) (equal? 3 3)) "O" "X")
```

```racket
(if (and (equal? 1 2) (equal? 3 3)) "X" "O")
```

```racket
(+ 1 2 3 4 5)
```

```racket
(+ (* 1 2) (/ 3 4) (quotient 5 6) (remainder 7 8) (- 9 10))
```

```racket
(equal? "a" "a")
```

```racket
(if (< 1 2) "O" "X")
```

#### 짝 (Pairs) ####

```cons``` 를 이용해 짝을 만들 수 있습니다; ```car```는 짝의 앞, ```cdr```은 뒤의 원소를 가져옵니다.

```racket
(car (cons 1 (cons 2 "three")))
```

```racket
(cdr (cons 1 (cons 2 "three")))
```

#### 리스트 (Lists) ####

리스트는 Racket에서 제공하는 유용한 자료구조로, 짝을 이용해 만들 수 있습니다.

```racket
(cons 0 (cons 1 (cons 2 '())))
```

```racket
(cons 0 '(1 2 3 4 5))
```

```racket
(cons 1 '())
```

```racket
(cons '() 1)
```

리스트가 비어있는지 아닌지를 확인할 수 있습니다.

```racket
(null? '())
```

```racket
(null? '(1 2 3))
```

두 개의 리스트를 이어붙일 수 있습니다.

```racket
(append '(1 2) '(3 4))
```

* 간단한 방법들
```racket
'(1 2 (+ 1 2) 4 5)
```

```racket
(list 1 2 (+ 1 2) 4 5)
```

#### Let Expressions ####

```let```을 이용하여 값에 이름을 줄 수 있습니다.

```racket
(let ([x 1] [y 2]) (+ x y))
```

### 정의하기 (Define) ###

같은 함수를 여러 번 사용해야 하는 경우, ```lambda```는 아래와 같이 사용하려는 횟수 만큼 사용해야 합니다.

```racket
(lambda (x) (+ x 1)) 1
(lambda (x) (+ x 1)) 2
(lambda (x) (+ x 1)) 3
```

이러한 방식은 같은 표현이 반복되므로 불필요한 타이핑이 많고 코드가 지저분합니다. ```define```을 이용하면 복잡한 수식을 변수로 지정할 수 있습니다.

```racket
(define s (string-append "Hello, " "World!\n"))
(print s)
```

```racket
(define lst '(1 3 5 7))
```

```racket
(define f (lambda (x) (+ x 1)))
(f 1)
```

```racket
(define f (lambda (x y z) (+ x y z)))
(f 2 3 4)
```

좀 더 쉽게 ```define```을 사용할 수 있습니다.

```racket
(define (mySum a b) (+ a b))
(mySum 5 6)
```

```racket
(define (myIdentity x)
	(if (equal? 0 x)
		0
		(+ (myIdentity (- x 1)) 1)))
(myIdentity 5)
```

### 재귀 (Recursion) ###

* 자기 자신을 다시 호출하는 경우, 재귀 (Recursion)라 합니다.

#### letrec을 이용한 재귀 ####

```letrec```을 이용하여 재귀함수를 정의할 수 있습니다:
```racket
(letrec
    ([myfactorial
      (lambda (n)
        (if (zero? n) 1 (* n (myfactorial (- n 1)))))])
  (myfactorial 10))
```

위의 예제에서, ```myfactorial``` 함수의 정의에서 ```myfactorial```를 호출하는 것을 확인할 수 있습니다. ```let```을 이용한 ```myfactorial```은 다음과 같습니다:
```racket
(let
    ([myfactorial
      (lambda (n)
        (if (zero? n) 1 (* n (myfactorial (- n 1)))))])
  (myfactorial 10))
```

#### define을 이용한 재귀 ####
```racket
(define myfactorial
    (lambda (n)
      (if (zero? n) 1 (* n (myfactorial (- n 1))))))

(factorial 10)
```

#### 예제 ####

* 리스트 반전:
```racket
(define (myRev l)
  (if (null? l)
      null
      (append (myRev (cdr l)) (list (car l)))))
(myRev (list 1 2 3 4))
```

```myRev```는 ```myRev``` 자신을 이용합니다. 
  
* 리스트의 모든 원소에 2를 더하기:
```racket
(define (add_two l)
  (if (null? l)
      null
      (cons (+ (car l) 2) (add_two (cdr l)))))
(add_two (list 1 2 3 4))
```

### 실습 ###

* 숫자의 부호를 구하십시오.

```racket
(define (sign x)
    (raise "TODO"))
(sign 0) ; "0"
(sign 1) ; "+"
(sign -1) ; "-"
```

* 숫자의 절댓값을 구하십시오.

```racket
(define (absolut x)
    (raise "TODO"))
(absolut 0) ; 0
(absolut 1) ; 1
(absolut -1) ; 1
```

* 리스트에서 가장 큰 원소를 찾으십시오.

```racket
(define (maxima lst)
    (raise "TODO"))
(maxima '()) ; 0
(maxima '(1 5 2 4 3)) ; 5
(maxima '(7 3 1)) ; 7
```

### 부록 ###

* number를 string으로 바꾸기

```racket
(number->string 123)
```

* string을 number로 바꾸기

```racket
(string->number "123")
```

* ```print```와 ```printf```의 차이점

```racket
(print "Hello, World!\n")
(printf "Hello, World!\n")
```

* ```let``` (let expression)

```racket
(let ((x (+ 1 2)) (y (+ 3 4)))
  (+ x y))
```

* ```maxima```

```racket
(define (maxima l)
  (if (null? l) 0
    (let ((fst (car l))
	      (acc (maxima (cdr l))))
	  (if (> fst acc) fst acc))))
```
