#lang racket
(require "hw1-4.rkt")
(provide zero one not-c and-c or-c)
(provide is-zero? is-one? is-not? is-and? is-or? sub-circuit)

(define zero
  (leaf 'z))
(define one
  (leaf 'o))
(define (not-c c)
  (node (list (leaf 'not) c)))
(define (and-c c1 c2)
  (node (list (leaf 'and) c1 c2)))
(define (or-c c1 c2)
  (node (list (leaf 'or) c1 c2)))

(define (get-name c)
  (leaf-val (nth-child c 0)))

(define (is-zero? c)
  (and (is-leaf? c) (equal? (leaf-val c) 'z)))
(define (is-one? c)
  (and (is-leaf? c) (equal? (leaf-val c) 'o)))
(define (is-not? c)
  (and (not (is-leaf? c))
       (equal? (get-name c) 'not))
  )
(define (is-and? c)
  (and (not (is-leaf? c))
       (equal? (get-name c) 'and))
  )
(define (is-or? c)
  (and (not (is-leaf? c))
       (equal? (get-name c) 'or))
  )

(define (sub-circuit c n)
  (nth-child c (+ 1 n)))
