#lang racket

(define (get n l)
  (if (equal? n 0)
      (car l)
      (get (- n 1) (cdr l))))

(define (const c)
  (list 'const c))
(define (is-const? e)
  (raise "TODO"))
(define (const-const e)
  (raise "TODO"))

(define (var x)
  (list 'var x))
(define (is-var? e)
  (raise "TODO"))
(define (var-var e)
  (raise "TODO"))

(define (plus l r)
  (list 'plus l r))
(define (is-plus? e)
  (raise "TODO"))
(define (plus-left e)
  (raise "TODO"))
(define (plus-right e)
  (raise "TODO"))

(define (minus e)
  (list 'minus e))
(define (is-minus? e)
  (raise "TODO"))
(define (minus-e e)
  (raise "TODO"))

(define (multiply l r)
  (list 'multiply l r))
(define (is-multiply? e)
  (raise "TODO"))
(define (multiply-left e)
  (raise "TODO"))
(define (multiply-right e)
  (raise "TODO"))

(define (differentiate v e)
  (cond [(is-const? e) (const 0)]
        [(is-var? e)
         (const (if (equal? (var-var e) v) 1 0))]
        [(is-plus? e)
         (raise "TODO")]
        [(is-minus? e)
         (raise "TODO")]
        [(is-multiply? e)
         (raise "TODO")]))

(define e1 ; 3x - 1
  (plus (multiply (const 3) (var "x"))
        (minus (const 1))))
(print (differentiate "x" e1))
(printf "\n")

(define e2 ; x^2 + 2x + 1
  (plus (multiply (var "x") (var "x"))
        (plus (multiply (const 2) (var "x"))
              (const 1))))
(print (differentiate "x" e2))
(printf "\n")
