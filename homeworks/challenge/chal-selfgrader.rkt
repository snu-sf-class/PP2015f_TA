#lang racket

(require "chal.rkt")

(printf (if (= (myeval '(if #t 0 1)) 0) "O\n" "X\n"))

(printf (if (= (myeval '(let ((x 3)) (+ x 1))) 4) "O\n" "X\n"))

