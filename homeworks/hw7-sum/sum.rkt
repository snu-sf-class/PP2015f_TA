#lang racket

(provide inl inr case-sum)

(define (inl v)
  (cons 'left v))

(define (inr v)
  (cons 'right v))

(define (case-sum f1 f2 s)
  (if (equal? (car s) 'left)
      (f1 (cdr s))
      (f2 (cdr s))
      ))
