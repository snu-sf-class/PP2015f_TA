#lang racket

(require "common-grade.rkt")
(require "hw2-3.rkt")

(define f1 (lambda (x) (+ 2 x)))
(define fadd (lambda (x) (cons (+ (car x) 1) (cdr x))))
(define exc (lambda (x) (cons (cdr x) (car x))))

(define (iterGrade)
	(begin
		(printf "iter\n")
        (sgoutput (lambda () (equal? ((iter 8 f1) 0) 16)))
        (sgoutput (lambda () (equal? ((iter 0 f1) 17) 17)))
        (sgoutput (lambda () (equal? ((iter 5 fadd) (cons 0 3)) (cons 5 3))))
        (sgoutput (lambda () (equal? ((iter 2 exc) (cons 1 2)) (cons 1 2))))
        (sgoutput (lambda () (equal? ((iter 3 exc) (cons 1 2)) (cons 2 1))))

))

(iterGrade)
