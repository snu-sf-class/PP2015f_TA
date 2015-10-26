#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw4-2.rkt")

(sgoutput
 (lambda ()
   (equal?
    (react (a (a (a S K) I) (v "x")))
    "x")))
(sgoutput
 (lambda ()
   (equal?
    (react (a (a K (v "x")) (a I (v "x"))))
    "x")))
(sgoutput
 (lambda ()
   (equal?
    (react (a (a (a (v "x") (v "y")) (v "z")) (v "w")))
    "(((x y) z) w)")))
