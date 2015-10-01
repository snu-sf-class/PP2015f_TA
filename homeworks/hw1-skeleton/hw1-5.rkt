#lang racket
(require "hw1-4.rkt")
(provide model make-branch make-mobile)
(provide weight is-balanced?)

(define (model n)
  (leaf n))

(define (make-branch n m)
  (cons n m))

(define (make-mobile b1 b2)
  (node (list b1 b2)))

(define (weight m)
  (if (is-leaf? m) (leaf-val m) (+ (weight (cdr (nth-child m 0))) (weight (cdr (nth-child m 1))))))

(define (is-balanced? m)
  (if (is-leaf? m) #t (and (is-balanced? (cdr (nth-child m 0))) (is-balanced? (cdr (nth-child m 1)))
                           (= (* (weight(cdr (nth-child m 0))) (car(nth-child m 0)))
                              (* (weight(cdr (nth-child m 1))) (car(nth-child m 1)))
                              ))))
