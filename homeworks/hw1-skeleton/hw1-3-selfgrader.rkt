#lang racket

(require "common-grade.rkt")
; this grader works only if you did hw1-1 correctly.
; However, for actual grading we will use the correct answer of hw1-1.
; So you will get proper grade even if you don't do hw1-1.

(require "hw1-1.rkt")
(require "hw1-3.rkt")

(define (crazy2mulGrade)
        (begin
                (printf "crazy2mul\n")
        (sgoutput (lambda () (equal? 0 (crazy2val (crazy2mul '(z) '(z))))))
        (sgoutput (lambda () (equal? -1 (crazy2val (crazy2mul '(n) '(p))))))
        (sgoutput (lambda () (equal? 0 (crazy2val (crazy2mul '(z) '(p))))))
        (sgoutput (lambda () (equal? 3 (crazy2val (crazy2mul '(p p) '(p))))))
        (sgoutput (lambda () (equal? 682 (crazy2val (crazy2mul '(n z z z) '(z p p z n p p z p z n))))))
))

(crazy2mulGrade)

