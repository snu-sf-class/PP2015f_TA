#lang racket
(require "hw1-6.rkt")
(provide output)

(define (output c)
  (if (eval c) 1 0))

(define (eval c)
  (if (is-zero? c) #f
      (if (is-one? c) #t
          (if (is-not? c) (not (eval (sub-circuit c 0)))
              (if (is-and? c) (and (eval (sub-circuit c 0)) (eval (sub-circuit c 1)))
                   (or (eval (sub-circuit c 0)) (eval (sub-circuit c 1)))
                      )))))