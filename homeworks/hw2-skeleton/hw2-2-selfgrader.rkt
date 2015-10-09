#lang racket

(require "common-grade.rkt")
(require "hw2-2.rkt")

(define (zipperNGrade)
	(begin
		(printf "zipperN\n")
        (sgoutput (lambda () (equal? '() (zipperN '(() ())) )))
        (sgoutput (lambda () (equal? '() (zipperN '(() () ())) )))
        (sgoutput (lambda () (equal? '(1 4 7 2 5 8 3 6 9) (zipperN '((1 2 3) (4 5 6) (7 8 9))))))
        (sgoutput (lambda () (equal? '(1 2 10 3 8 20 5 30 7) (zipperN '((1 3 5 7) (2 8) () (10 20 30))))))
        (sgoutput (lambda () (equal? '(2 4 5) (zipperN '(() () (2 4 5) ())))))
))

(zipperNGrade)
