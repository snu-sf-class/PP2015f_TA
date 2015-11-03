#lang racket

(require "common-grade.rkt")
(require "hw5-1.rkt")
(require "hw5-2.rkt")
(require "hw5-3.rkt")

(define unit '())

(define l1 empty)
(define l2 (link 1 (link 2 empty)))

(define (left? s)
  (case-sum
   (lambda (v) #t)
   (lambda (v) #f)
   s))

(define (right-unit? s)
  (case-sum
   (lambda (v) #f)
   (lambda (v) (equal? v '()))
   s))

(define (get-left s)
  (case-sum
   (lambda (v) v)
   (lambda (v) 'not-left)
   s))

(define (ssumlistGrade)
  (begin
    (printf "ssumlist\n")
    (sgoutput (lambda () (equal? (is-empty? l1) #t) ))
    (sgoutput (lambda () (equal? (right-unit? (fst l1)) #t) ))
    (sgoutput (lambda () (equal? (get-left (fst l2)) 1) ))
    (sgoutput (lambda () (equal? (right-unit? (rest l1)) #t) ))
    (sgoutput (lambda ()
		(equal?
		 (is-empty?
		  (get-left (rest (get-left (rest l2)))))
		  #t)))

    (sgoutput (lambda () (equal? (length l2) 2) ))
    (sgoutput (lambda () (equal? (length l1) 0) ))
    (sgoutput (lambda () (equal? (right-unit? (nth-elmt l2 2)) #t)))
    (sgoutput (lambda () (equal? (get-left (nth-elmt (map (lambda (x) (+ x 1)) l2) 0)) 2)))
    (sgoutput (lambda () (equal? (reduce l2 (lambda (a b) (+ a b)) 1) 4  )))
    ))

(ssumlistGrade)
