#lang racket


(define (leaf v) ; int -> tree
  (list 'leaf v))

(define (is-leaf t) ; tree -> bool
  (equal? 'leaf (car t)))

(define (leaf-value t) ; tree -> int
  (cadr t))


(define (branch l r) ; tree * tree -> tree
  (list 'branch l r))

(define (is-branch t) ; tree -> bool
  (equal? 'branch (car t)))

(define (branch-left t) ; tree -> tree
  (cadr t))

(define (branch-right t) ; tree -> tree
  (caddr t))


(define (pprint-tree t) ; tree -> string
  (if (is-branch t)
      (string-append
       "("
       (pprint-tree (branch-left t))
       " "
       (pprint-tree (branch-right t))
       ")")
      (leaf-value t)))


(define ex (branch (branch (branch (leaf 0) (leaf 1)) (leaf 2)) (branch (leaf 3) (leaf 4))))
(pprint-tree ex) ; (((0 1) 2) (3 4))
