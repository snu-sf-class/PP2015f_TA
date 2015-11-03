#lang racket

(require "common-grade.rkt")
(require "hw5-1.rkt")

;for int and list
(define sum-of-int (inl 3))
(define sum-of-list (inr '(1 3 5 6)))

(define seq-length
  (lambda (s)
    (case-sum
     (lambda (n) n)
     (lambda (l) (length l))
     s))
  )

;for pair and list
(define s-o-p (inl (cons 1 2)))
(define s-o-l (inr '(1 3)))

(define snd-elem
  (lambda (s)
    (case-sum
     (lambda (p) (cdr p))
     (lambda (l) (list-ref l 1))
     s
     )))


(define (ssumGrade)
  (begin
    (printf "ssum\n")
    (sgoutput (lambda () (equal? (seq-length sum-of-int) 3) ))
    (sgoutput (lambda () (equal? (seq-length sum-of-list) 4) ))
    (sgoutput (lambda () (equal? (snd-elem s-o-p) 2) ))
    (sgoutput (lambda () (equal? (snd-elem s-o-l) 3) ))
    ))

(ssumGrade)
