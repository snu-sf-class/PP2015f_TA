#lang racket
(require "hw1-6.rkt")
(provide output)

(define (inv-bit b)
  (if (= b 0) 1 0))

(define (and-bit b1 b2)
  (* b1 b2))

(define (or-bit b1 b2)
  (if (= 0 (+ b1 b2)) 0 1))

(define (output c)
  (if (is-zero? c) 0
      (if (is-one? c) 1
          (if (is-not? c) (inv-bit (output (sub-circuit c 0)))
              (if (is-and? c) (and-bit (output (sub-circuit c 0)) (output (sub-circuit c 1)))
                  (or-bit (output (sub-circuit c 0)) (output (sub-circuit c 1)))
                  ))))
  )
