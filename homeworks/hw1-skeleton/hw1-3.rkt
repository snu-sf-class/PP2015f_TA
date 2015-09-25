#lang racket

(require "hw1-1.rkt")
(require "hw1-2.rkt")
(provide crazy2mul)

(define (crazy2neg val)
  (if (null? val)
      '(z)
      (match (car val)
        ['n (cons 'p (crazy2neg (cdr val)))]
        ['z (cons 'z (crazy2neg (cdr val)))]
        ['p (cons 'n (crazy2neg (cdr val)))])))

(define (crazy2mul lhs rhs)
	(if (null? lhs)
            '(z)
            (if (null? rhs)
                '(z)
                (match (car lhs)
                  ['n (crazy2add (crazy2neg rhs) (cons 'z (crazy2mul (cdr lhs) rhs)))]
                  ['p (crazy2add rhs (cons 'z (crazy2mul(cdr lhs) rhs)))]
                  ['z (cons 'z (crazy2mul (cdr lhs) rhs))]))))
  