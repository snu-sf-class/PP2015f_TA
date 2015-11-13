#lang racket
(require "hw1-4.rkt")
(provide model make-branch make-mobile)
(provide is-balanced? weight)

(define (model n)
  (leaf n))

(define (make-branch n m)
  (node (list (leaf n) m))
  )

(define (make-mobile b1 b2)
  (node (list b1 b2))
  )

(define (get-len b)
  (leaf-val (nth-child b 0)))

(define (get-model b)
  (nth-child b 1))

(define (weight m)
  (if (is-leaf? m) (leaf-val m)
      (+ (weight (get-model (nth-child m 0)))
         (weight (get-model (nth-child m 1))))
      )
  )

(define (is-balanced? m)
  (if (is-leaf? m) #t
      (let ((b1 (nth-child m 0)) (b2 (nth-child m 1)))
        (let ((l1 (get-len b1)) (m1 (get-model b1))
              (l2 (get-len b2)) (m2 (get-model b2)))
          (and (and (is-balanced? m1) (is-balanced? m2))
               (= (* l1 (weight m1)) (* l2 (weight m2))))
          )))
  )
