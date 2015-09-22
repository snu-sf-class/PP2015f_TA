#lang racket

(require "common-grade.rkt")
(require "hw1-6.rkt")
(require "hw1-7.rkt")

(define c1 zero)
(define c2 one)
(define c3 (not-c c1))
(define c4 (and-c c2 c3))
(define c5 (not-c c4))
(define c6 (or-c c3 c5))


(define (circuitoutputGrade)
  (begin
    (printf "circuit\n")
    (sgoutput (lambda () (equal? 1 (output c2)) ))
    (sgoutput (lambda () (equal? 1 (output c3)) ))
    (sgoutput (lambda () (equal? 1 (output c4)) ))
    (sgoutput (lambda () (equal? 0 (output c5)) ))
    (sgoutput (lambda () (equal? 1 (output c6)) ))
))

(circuitoutputGrade)

