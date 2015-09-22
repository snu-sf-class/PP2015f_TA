#lang racket

(require "common-grade.rkt")
(require "hw1-1.rkt")

(define (crazy2valGrade)
        (begin
                (printf "crazy2val\n")
        (sgoutput (lambda () (equal? -1 (crazy2val (cons 'n null)))))
        (sgoutput (lambda () (equal? 1 (crazy2val '(p z z z)))))
        (sgoutput (lambda () (equal? 1 (crazy2val (list 'p)))))
        (sgoutput (lambda () (equal? 9 (crazy2val '(n n p p z)))))
        (sgoutput (lambda () (equal? -13 (crazy2val '(n z p z p n)))))
))

(crazy2valGrade)

