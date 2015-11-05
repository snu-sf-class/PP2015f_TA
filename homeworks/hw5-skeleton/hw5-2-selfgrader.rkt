#lang racket

(require "common-grade.rkt")
(require "hw5-2.rkt")

(define safe-car
  (lambda (l)
    (case-list
     (lambda (u) 'empty-list)
     (lambda (h t) h)
     l))
  )

(define safe-cdr
  (lambda (l)
    (case-list
     (lambda (u) 'empty-list)
     (lambda (h t) t)
     l))
  )

(define l1 empty)
(define l2 (link 1 (link 2 empty)))

(define (slistGrade)
  (begin
    (printf "slist\n")
    (sgoutput (lambda () (equal? (safe-car l1) 'empty-list) ))
    (sgoutput (lambda () (equal? (safe-car l2) 1) ))
    (sgoutput (lambda () (equal? (safe-cdr l1) 'empty-list) ))
    (sgoutput (lambda () (equal? (safe-car (safe-cdr l2)) 2) ))
    ))

(slistGrade)
