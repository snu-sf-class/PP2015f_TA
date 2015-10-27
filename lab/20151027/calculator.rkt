#lang racket

(define (const c)
  (list 'const c))
(define (is-const? e)
  'TODO)
(define (const-const e)
  'TODO)

(define (var x)
  (list 'var x))
(define (is-var? e)
  'TODO)
(define (var-var e)
  'TODO)

(define (plus l r)
  (list 'plus l r))
(define (is-plus? e)
  'TODO)
(define (plus-left e)
  'TODO)
(define (plus-right e)
  'TODO)

(define (minus e)
  (list 'minus e))
(define (is-minus? e)
  'TODO)
(define (minus-e e)
  'TODO)

(define (multiply l r)
  (list 'multiply l r))
(define (is-multiply? e)
  'TODO)
(define (multiply-left e)
  'TODO)
(define (multiply-right e)
  'TODO)

(define (calculate env e)
  (cond [(is-const? e)
         'TODO]
        [(is-var? e)
         'TODO]
        [(is-plus? e)
         'TODO]
        [(is-minus? e)
         'TODO]
        [(is-multiply? e)
         'TODO]))

(define env (list (cons "x" 3) (cons "y" 4) (cons "z" 5)))

(define e1 ; 3x - 1
  (plus (multiply (const 3) (var "x"))
        (minus (const 1))))
(print (calculate env e1)) ; 8
(printf "\n")

(define e2 ; x^2 + 2z + 1
  (plus (multiply (var "x") (var "x"))
        (plus (multiply (const 2) (var "z"))
              (const 1))))
(print (calculat env e2)) ; 20
(printf "\n")
