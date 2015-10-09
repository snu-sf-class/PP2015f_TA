#lang racket

(provide crazy2val)

(define (crazy2val c)
  (if (null? c)
      0
      (if (equal? (car c) 'z)
          (* 2 (crazy2val (cdr c)))
          (if (equal? (car c) 'p)
              (+ 1 (* 2 (crazy2val (cdr c))))
              (+ -1 (* 2 (crazy2val (cdr c)))) ))))