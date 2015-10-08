#lang racket

(require "common-grade.rkt")
(require "hw2-1.rkt")

(define (zipperGrade)
	(begin
		(printf "zipper\n")
        (sgoutput (lambda () (equal? '() (zipper '() '()))))
        (sgoutput (lambda () (equal? '(1 4 3 2) (zipper '(1 3 2) '(4)))))
        (sgoutput (lambda () (equal? '(1 5 2 6 3 4) (zipper '(1 2 3 4) '(5 6)))))
        (sgoutput (lambda () (equal? '(1 4 2) (zipper '() '(1 4 2)))))
        (sgoutput (lambda () (equal? '(5 3) (zipper '(5 3) '()))))
))

(zipperGrade)
