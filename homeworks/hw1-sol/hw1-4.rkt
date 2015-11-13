#lang racket
(provide leaf node)
(provide is-empty-tree? is-leaf? leaf-val nth-child)

(define (leaf n)
  (cons 'aleaf (cons 'val n)))

(define (node l)
  (cons 'anode (cons 'list l)))

(define (is-empty-tree? t)
  (and (equal? (car t) 'anode)
       (null? (cddr t)))
  )

(define (is-leaf? t)
  (equal? (car t) 'aleaf))

(define (leaf-val t)
  (cddr t))

(define (get-nth l n)
  (if (null? l) '()
      (if (= n 0) (car l)
          (get-nth (cdr l) (- n 1))
          )))

(define (nth-child t n)
  (get-nth (cddr t) n))
