#lang racket

(require "hw3-2-library.rkt")
(require "hw3-2.rkt")
(require "common-grade.rkt")

(define maze1
  (cons 4
        '((1 4) (0 5) (3 6) (2 7)
          (0 5 8) (1 4) (2) (3)
          (4 12) (10 13) (9 11 14) (10)
          (8 13) (9 12) (10 15) (14))))

(define room1 0)
(define room2 15)
(define room3 7)

(sgoutput (lambda () (equal? #t (maze-check maze1 room1 room2))))
(sgoutput (lambda () (equal? #f (maze-check maze1 room2 room3))))
