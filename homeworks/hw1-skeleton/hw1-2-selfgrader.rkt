#lang racket

(require "common-grade.rkt")
; this grader works only if you did hw1-1 correctly.
; However, for actual grading we will use the correct answer of hw1-1.
; So you will get proper grade even if you don't do hw1-1.
 
(require "hw1-1.rkt")
(require "hw1-2.rkt")

(define (crazy2addGrade)
        (begin
                (printf "crazy2add\n")
        (sgoutput (lambda () (equal? 0 (crazy2val (crazy2add '(z) '(z))))))
        (sgoutput (lambda () (equal? 0 (crazy2val (crazy2add '(n) '(p))))))
        (sgoutput (lambda () (equal? 1 (crazy2val (crazy2add '(z) '(p))))))
        (sgoutput (lambda () (equal? 4 (crazy2val (crazy2add '(p p) '(p))))))
        (sgoutput (lambda () (equal? -683 (crazy2val (crazy2add '(n z z z) '(z p p z n p p z p z n))))))
))

(crazy2addGrade)

