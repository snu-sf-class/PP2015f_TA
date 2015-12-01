#lang racket

(require "chal.rkt")

(printf (if (= (myeval '(if #t 0 1)) 0) "O\n" "X\n"))

(printf (if (= (myeval '(let ((x 3)) (+ x 1))) 4) "O\n" "X\n"))

;to use eval
(define ns (make-base-namespace))

(define (test p)
  (define a (myeval p))
  (define b (eval p ns))
  (if (equal? a b)
    (printf "O\n")
    (let ()
      (printf "X\n  yours: ")
      (write a) (newline)
      (printf "  ans: ")
      (write b) (newline)
      )))

(define t0 '3)
(test t0)

(define t1 '#t)
(test t1)

(define t2 ''())
(test t2)

(define t3 '(+ 1 2))
(test t3)

(define t4 '(+ (* 3 5) (- 6 1)))
(test t4)

(define t5 '(if #f (+ 1 2) (* 3 5)))
(test t5)

(define t6 '(cons 1 2))
(test t6)

(define t7 '(cons (cons 1 2) (cons 3 4)))
(test t7)

(define t8 '(cons (+ 1 2) (* 3 4)))
(test t8)

(define t9 '(car (cons (+ 1 2) (* 3 4))))
(test t9)

(define t10  '(let ((p (cons 1 (cons 2 '())))) (cons 0 p)))
(test t10)

(define t11  '(letrec ((p (cons 1 (cons 2 '())))) (cons 0 p)))
(test t11)

(define t12  '((lambda (x) (+ x 1)) 3))
(test t12)

(define t13 '(letrec ((f (lambda (x) (if (= x 0) 1 (* (f (- x 1)) x) )))) (f 5)))
(test t13)

(define t14 '((lambda (x) (if (= x 0) 1 (*((lambda (y) (if (= y 0) 1 (* (- y 1) y) )) (- x 1)) x) )) 5))
(test t14)

(define t14_ '((lambda (x) (if (= x 0) 1 (*((lambda (x) (if (= x 0) 1 (* (- x 1) x) )) (- x 1)) x) )) 5))
(test t14_)
