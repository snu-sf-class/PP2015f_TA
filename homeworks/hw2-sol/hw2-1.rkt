#lang racket

(provide zipper)

(define (zipper l1 l2)
  (if (null? l1) l2
    (cons (car l1) (zipper l2 (cdr l1)))
  ))

