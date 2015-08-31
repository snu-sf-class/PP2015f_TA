# Lab Session, Principles of Programming #

20140917 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/jeehoon.kang), [Yoonseung Kim](http://ropas.snu.ac.kr/~yskim)

## Announcement ##

### Homework ###

* See [general instruction on homework](../../homeworks/instr-hw.md).
* [HW1](http://sf.snu.ac.kr/gil.hur/4190.210/14/hws/hw1-eng.pdf) is out.

### Lab Session ###

* If you don't have an account, try ID `pp2014-2`.
* You may leave anytime you want, once TA explained today's contents.
* Questions to TAs are very encouraged.
* However, as you will see, TAs are very answering your questions in lab session. You may have to wait for 10 minutes for a TA! For your own sake, try to ask students around you first.

## Lab Material ##

We aim to learn concepts related to the homework 1.

### Value and Expression of Racket ###

#### Value ####

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
'jee
'yoon
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

#### Expression ####

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

Other expressions:

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

#### Pairs ####

Use ```cons``` to make a pair; ```car```, to get the first element; ```cdr```, to get the last one.

```racket
(car (cons 1 (cons 2 "three")))
```

```racket
(cdr (cons 1 (cons 2 "three")))
```

#### Lists ####

Lists are favorable data structure in Racket. In fact, lists are pairs constructed in a regular way.

```racket
(cons 0 (cons 1 (cons 2 '())))
```

```racket
(cons 0 '(1 2 3 4 5))
```

```racket
(cons 1 '())
```

You can check if a list is null.

```racket
(null? '())
```

```racket
(null? '(1 2 3))
```

Append two lists.

```racket
(append '(1 2) '(3 4))
```

* Rather than:
```racket
'(1 2 (+ 1 2) 4 5)
```

* spell like:
```racket
(list 1 2 (+ 1 2) 4 5)
```

#### Let Expressions ####

If you want to express a complex calculation, you may want to name an intermediate result. In that case, you may want to use ```let```:
```racket
(let ([x 1] [y 2]) (+ x y))
```

### Define ###

Suppose you want to apply the same function several times.
```racket
(lambda (x) (+ x 1)) 1
(lambda (x) (+ x 1)) 2
(lambda (x) (+ x 1)) 3
```

This is quite inconvenient as you have to type much, and ugly since the same bit pattern recurs. To solve this problem, you can assign an expression in a variable by ```define```, however complicated the expression is.

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

There is a easier way to ```define``` a procedure.

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

### Recursion ###

* If a procedure(myfactorial) uses the very procedure(myfactorial), the procedure is called **recursion**. Let's see the myfactorial example.

#### Recursion with letrec ####

You can define a recursive function with ```letrec```:
```racket
(letrec
    ([myfactorial
      (lambda (n)
        (if (zero? n) 1 (* n (myfactorial (- n 1)))))])
  (myfactorial 10))
```

As you can see, the definition of ```myfactorial``` calls ```myfactorial```. In other words, ```myfactorial``` uses itself! Contrast this with ```let``` version:
```racket
(let
    ([myfactorial
      (lambda (n)
        (if (zero? n) 1 (* n (myfactorial (- n 1)))))])
  (myfactorial 10))
```

#### Recursion with define ####
```racket
(define myfactorial
    (lambda (n)
      (if (zero? n) 1 (* n (myfactorial (- n 1))))))

(factorial 10)
```

```racket
(define myfactorial
    (lambda (n)
      (if (zero? n) 1 (* n (myfactorial (- n 1))))))

(factorial 10)
```

#### Examples ####

* Reversing list:
```racket
(define (myRev l)
  (if (null? l)
      null
      (append (myRev (cdr l)) (list (car l)))))
(myRev (list 1 2 3 4))
```

```myRev``` uses ```myRev``` itself. Recursion like this is widely used for such data structures whose size is not pre-defined as lists.
  
* Adding 2 for all elements of a list:
```racket
(define (add_two l)
  (if (null? l)
      null
      (cons (+ (car l) 2) (add_two (cdr l)))))
(add_two (list 1 2 3 4))
```

### Labwork ###

* Get the sign of a number.

```racket
(define (sign x)
    (raise "TODO"))
(sign 0) ; "0"
(sign 1) ; "+"
(sign -1) ; "-"
```

* Get the absolute number of a number.

```racket
(define (absolut x)
    (raise "TODO"))
(absolut 0) ; 0
(absolut 1) ; 1
(absolut -1) ; 1
```

* Get the largest element of a list.

```racket
(define (maxima lst)
    (raise "TODO"))
(maxima '()) ; 0
(maxima '(1 5 2 4 3)) ; 5
(maxima '(7 3 1)) ; 7
```

### Addendum ###

* Convert a number to a string

```racket
(number->string 123)
```

* Convert a string to a number

```racket
(string->number "123")
```

* ```print``` and ```printf```: what's the difference?

```racket
(print "Hello, World!\n")
(printf "Hello, World!\n")
```

* ```let``` (let expression)

```racket
(let ((x (+ 1 2)) (y (+ 3 4)))
  (+ x y))
```

* ```maxima```: a solution

```racket
(define (maxima l)
  (if (null? l) 0
    (let ((fst (car l))
	      (acc (maxima (cdr l))))
	  (if (> fst acc) fst acc))))
```
