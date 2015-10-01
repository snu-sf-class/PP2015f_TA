#lang racket
(provide leaf node)
(provide is-empty-tree? is-leaf? leaf-val nth-child)

(define (leaf n)
  (list n))

(define (node l)
  l)

(define (is-empty-tree? t)
  (if (null? t) #t #f))

(define (is-leaf? t)
  (if (= (length t) 1) #t #f))

(define (leaf-val t)
  (list-ref t 0))

(define (nth-child t n)
  (list-ref t n))
