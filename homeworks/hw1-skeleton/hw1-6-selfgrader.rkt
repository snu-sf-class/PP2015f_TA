#lang racket

(require "common-grade.rkt")
(require "hw1-6.rkt")

(define c1 zero)
(define c2 one)
(define c3 (not-c c1))
(define c4 (and-c c2 c3))
(define c5 (not-c c4))
(define c6 (or-c c3 c5))


(define (circuitGrade)
  (begin
    (printf "circuit\n")
    (sgoutput (lambda () (equal? #t (is-zero? c1)) ))
    (sgoutput (lambda () (equal? #t (is-or? c6)) ))
    (sgoutput (lambda () (equal? c1 (sub-circuit c3 0)) ))
    (sgoutput (lambda () (equal? c3 (sub-circuit c6 0)) ))
    (sgoutput (lambda () (equal? #t (is-and? (sub-circuit (sub-circuit c6 1) 0))) ))
))

(circuitGrade)

