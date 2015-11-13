#lang racket

(require "hw1-2.rkt")
(provide crazy2mul)

(define (inv-sym s)
  (if (equal? s 'p) 'n
      (if (equal? s 'n) 'p 'z)
      ))

(define (inv c)
  (if (null? c) null
      (cons (inv-sym (car c)) (inv (cdr c)))
      ))

(define (crazy2mul-sym c sym)
  (if (equal? sym 'z) (cons 'z null)
      (if (equal? sym 'p) c (inv c))))

(define (crazy2mul lhs rhs)
  (if (null? rhs) (cons 'z null)
      (crazy2add (crazy2mul-sym lhs (car rhs))
                 (cons 'z (crazy2mul lhs (cdr rhs))))
      )
  )
