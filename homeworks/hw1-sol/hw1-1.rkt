#lang racket

(provide crazy2val)

(define (crazy2val-sym s)
	(if (equal? s 'z) 0
	    (if (equal? s 'p) 1 -1)))

(define (crazy2val c)
	(if (null? c) 0
	    (+ (crazy2val-sym (car c)) (* 2 (crazy2val (cdr c))))
	))
