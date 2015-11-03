#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw5-4.rkt")

(printf "1. Internal Representations\n")
; In this homework, we strictly guide the internal structure of tiles.
; This auto-grader should results in "O" (rather than "X") for the
; following test cases.
;
;
(printf "1) Basic Representations\n")
; First of all, black tile should be 'B.
(sgoutput (lambda () (equal? 'B black)))
; Likewise, white tile should be 'W.
(sgoutput (lambda () (equal? 'W white)))
; Note that these two basic tile should be both array and tree:
(sgoutput (lambda () (equal? #t (is-tree? black))))
(sgoutput (lambda () (equal? #t (is-tree? white))))
(sgoutput (lambda () (equal? #t (is-array? black))))
(sgoutput (lambda () (equal? #t (is-array? white))))
;
;
; These are for ease of reading this grader.
(define B black)
(define W white)
;
;
; Tiles are of two kinds: arrays and trees.
; These are constructed by: glue-*-from-*.
;
(printf "2) Array Representations\n")
; Array tile should look like:
(define basic-array (glue-array-from-array B B B W))
(sgoutput (lambda () (equal? '(array (B B) (W B))
                           basic-array)))
(sgoutput (lambda () (equal? '(array (B B) (W B))
                           (glue-array-from-tree B B B W))))
;
(printf "3) Tree Representations\n")
; Tree tile should look like:
(define basic-tree (glue-tree-from-tree B B B W))
(sgoutput (lambda () (equal? '(tree B B B W)
                           basic-tree)))
(sgoutput (lambda () (equal? '(tree B B B W)
                           (glue-tree-from-array B B B W))))
;
(printf "4) Bigger Examples\n")
; Try bigger ones.
(define (turn-array pattern i)
  (if (<= i 0) 
      pattern
      (turn-array (rotate-array pattern) (- i 1))))
(define (turn-tree pattern i)
  (if (<= i 0) 
      pattern
      (turn-tree (rotate-tree pattern) (- i 1))))
(define compound1-array
  (glue-array-from-array
   basic-array
   (turn-array basic-array 1)
   (turn-array basic-array 2)
   (turn-array basic-array 3)))
(define compound2-array
  (rotate-array
   (glue-array-from-array
    basic-array
    basic-array
    (rotate-array basic-array)
    (rotate-array basic-array))))
(sgoutput (lambda () (equal? '(array (B B W B) (W B B B) (B B B W) (B W B B))
                           compound1-array)))
(sgoutput (lambda () (equal? '(array (B W W B) (B B B B) (B W W B) (B B B B))
                           compound2-array)))
(define compound1-tree
  (glue-tree-from-tree
   basic-tree
   (turn-tree basic-tree 1)
   (turn-tree basic-tree 2)
   (turn-tree basic-tree 3)))
(define compound2-tree
  (rotate-tree
   (glue-tree-from-tree
    basic-tree
    basic-tree
    (rotate-tree basic-tree)
    (rotate-tree basic-tree))))
(sgoutput (lambda () (equal? '(tree (B B B W) (W B B B) (B W B B) (B B W B))
                           compound1-tree)))
(sgoutput (lambda () (equal? '(tree (B W B B) (W B B B) (W B B B) (B W B B))
                           compound2-tree)))


(printf "2. Interface Operability\n")

(printf "1) pprint\n")

; pprint (and pprint-*) should results in string as follows.
; Black (white) tile should be represented as "B" ("W").
; Each row are separated by new line character "\n".
; The last line also should contains "\n" after it.
(sgoutput (lambda () (equal? "BBWB\nWBBB\nBBBW\nBWBB\n"
                               (pprint-array compound1-array))))
(sgoutput (lambda () (equal? "BWWB\nBBBB\nBWWB\nBBBB\n"
                               (pprint-array compound2-array))))
(sgoutput (lambda () (equal? "BBWB\nWBBB\nBBBW\nBWBB\n"
                               (pprint-tree compound1-tree))))
(sgoutput (lambda () (equal? "BWWB\nBBBB\nBWWB\nBBBB\n"
                               (pprint-tree compound2-tree))))

(printf "2) neighbor\n")

(sgoutput (lambda () (equal? 2 (neighbor-array (list 0 0) compound1-array))))
(sgoutput (lambda () (equal? 6 (neighbor-array (list 2 0) compound1-array))))
(sgoutput (lambda () (equal? 2 (neighbor-array (list 3 3) compound1-array))))
(sgoutput (lambda () (equal? 3 (neighbor-array (list 0 3) compound2-array))))
(sgoutput (lambda () (equal? 4 (neighbor-array (list 1 3) compound2-array))))
(sgoutput (lambda () (equal? 2 (neighbor-array (list 2 2) compound2-array))))

(sgoutput (lambda () (equal? 2 (neighbor-tree (list 0 0) compound1-tree))))
(sgoutput (lambda () (equal? 6 (neighbor-tree (list 2 0) compound1-tree))))
(sgoutput (lambda () (equal? 2 (neighbor-tree (list 3 3) compound1-tree))))
(sgoutput (lambda () (equal? 3 (neighbor-tree (list 0 3) compound2-tree))))
(sgoutput (lambda () (equal? 4 (neighbor-tree (list 1 3) compound2-tree))))
(sgoutput (lambda () (equal? 2 (neighbor-tree (list 2 2) compound2-tree))))

(printf "3) translation\n")
(sgoutput (lambda () (equal? compound1-tree (array-to-tree compound1-array))))
(sgoutput (lambda () (equal? compound2-tree (array-to-tree compound2-array))))
(sgoutput (lambda () (equal? compound1-array (tree-to-array compound1-tree))))
(sgoutput (lambda () (equal? compound2-array (tree-to-array compound2-tree))))


(printf "3. Casual Examples\n")


(define basic (glue B B B W))
(define (turn pattern i)
  (if (<= i 0) 
      pattern
      (turn (rotate pattern) (- i 1))))
(define compound1
  (glue basic (turn basic 1) (turn basic 2) (turn basic 3)))
(define compound2
  (rotate (glue basic basic (rotate basic) (rotate basic))))

(sgoutput (lambda () (equal? "BBWB\nWBBB\nBBBW\nBWBB\n"
                               (pprint compound1))))
(sgoutput (lambda () (equal? "BWWB\nBBBB\nBWWB\nBBBB\n"
                               (pprint compound2))))

(sgoutput (lambda () (equal? 2 (neighbor (list 0 0) compound1))))
(sgoutput (lambda () (equal? 6 (neighbor (list 2 0) compound1))))
(sgoutput (lambda () (equal? 2 (neighbor (list 3 3) compound1))))
(sgoutput (lambda () (equal? 3 (neighbor (list 0 3) compound2))))
(sgoutput (lambda () (equal? 4 (neighbor (list 1 3) compound2))))
(sgoutput (lambda () (equal? 2 (neighbor (list 2 2) compound2))))
