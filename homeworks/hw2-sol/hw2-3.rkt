#lang racket

(provide iter)

(define (abs-val n)
  (if (< n 0) (* -1 n) n))

(define (iter-abs n f)
  (if (= n 0) (lambda (x) x)
    (lambda (x) ((iter-abs (- n 1) f) (f x)))
  ))

(define (iter n f)
  (iter-abs (abs-val n) f))

