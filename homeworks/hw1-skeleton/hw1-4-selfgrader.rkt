#lang racket

(require "common-grade.rkt")
(require "hw1-4.rkt")

(define testtree0
  (node (list (leaf 1))))
(define testtree1
  (node (list testtree0 (leaf 2))))
(define testtree2
  (node (list testtree0 testtree1 testtree0 (leaf 6))))

(define (treeGrade)
  (begin
    (printf "tree\n")
    (sgoutput (lambda () (equal? #t (is-leaf? (leaf '(1 2)))) ))
    (sgoutput (lambda () (equal? #t (is-leaf? (leaf (node (list (leaf 1)))))) ))
    (sgoutput (lambda () (equal? #t (is-empty-tree? (node '())))))
    (sgoutput (lambda () (equal? 'val (leaf-val (leaf 'val))) ))
    (sgoutput (lambda () (equal? (leaf 6) (nth-child testtree2 3)) ))
))

(treeGrade)

