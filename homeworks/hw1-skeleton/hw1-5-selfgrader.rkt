#lang racket

(require "common-grade.rkt")
(require "hw1-5.rkt")

(define mdl1 (model 1))
(define mdl2 (model 2))
(define b1 (make-branch 12 mdl1))
(define b2 (make-branch 7 mdl2))
(define mbl1 (make-mobile b1 b2))

(define mdl3 (model 6))
(define mdl4 (model 4))
(define b3 (make-branch 10 mdl3))
(define b4 (make-branch 15 mdl4))
(define mbl2 (make-mobile b4 b3))

(define b5 (make-branch 10 mbl1))
(define b6 (make-branch 3 mbl2))
(define mbl3 (make-mobile b5 b6))


(define (mobileGrade)
  (begin
    (printf "mobile\n")
    (sgoutput (lambda () (equal? 2 (weight mdl2)) ))
    (sgoutput (lambda () (equal? 6 (weight mdl3)) ))
    (sgoutput (lambda () (equal? 13 (weight mbl3)) ))
    (sgoutput (lambda () (equal? #t (is-balanced? mdl1)) ))
    (sgoutput (lambda () (equal? #f (is-balanced? mbl3)) ))
))

(mobileGrade)

