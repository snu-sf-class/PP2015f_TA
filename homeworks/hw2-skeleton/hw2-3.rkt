#lang racket

(provide iter)

(define (iter n f)
  (lambda (x)
    (define (iter-aux n f k)
    (if (= n 0) k (iter-aux (- n 1) f (f k))))
    (iter-aux n f x)))