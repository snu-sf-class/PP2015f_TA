#lang racket

(provide crazy2add)

(define (crazy2add lhs rhs)
	(if (null? lhs)
            rhs
            (if (null? rhs)
                lhs
                (match (cons (car lhs) (car rhs))
                  [(cons 'n 'n) (cons 'z (crazy2add (crazy2add (cdr lhs) (cdr rhs)) '(n)))]
                  [(cons 'n 'z) (cons 'n (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'z 'n) (cons 'n (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'z 'z) (cons 'z (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'n 'p) (cons 'z (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'p 'n) (cons 'z (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'p 'z) (cons 'p (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'z 'p) (cons 'p (crazy2add (cdr lhs) (cdr rhs)))]
                  [(cons 'p 'p) (cons 'z (crazy2add (crazy2add (cdr lhs) (cdr rhs)) '(p)))])
                )))