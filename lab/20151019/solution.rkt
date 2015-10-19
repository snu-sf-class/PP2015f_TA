#lang racket

;;; differentiate

(define (get n l)
  (if (equal? n 0)
      (car l)
      (get (- n 1) (cdr l))))

(define (const c)
  (list 'const c))
(define (is-const? e)
  (equal? 'const (get 0 e)))
(define (const-const e)
  (get 1 e))

(define (var x)
  (list 'var x))
(define (is-var? e)
  (equal? 'var (get 0 e)))
(define (var-var e)
  (get 1 e))

(define (plus l r)
  (list 'plus l r))
(define (is-plus? e)
  (equal? 'plus (get 0 e)))
(define (plus-left e)
  (get 1 e))
(define (plus-right e)
  (get 2 e))

(define (minus e)
  (list 'minus e))
(define (is-minus? e)
  (equal? 'minus (get 0 e)))
(define (minus-e e)
  (get 1 e))

(define (multiply l r)
  (list 'multiply l r))
(define (is-multiply? e)
  (equal? 'multiply (get 0 e)))
(define (multiply-left e)
  (get 1 e))
(define (multiply-right e)
  (get 2 e))

(define (differentiate v e)
  (cond [(is-const? e) (const 0)]
        [(is-var? e)
         (const (if (equal? (var-var e) v) 1 0))]
        [(is-plus? e)
         (plus (differentiate v (plus-left e)) (differentiate v (plus-right e)))]
        [(is-minus? e)
         (minus (differentiate v (minus-e e)))]
        [(is-multiply? e)
         (let* ([l (multiply-left e)]
                [r (multiply-right e)]
                [dl (differentiate v l)]
                [dr (differentiate v r)])
           (plus (multiply dl r) (multiply dr l)))]))

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


;;; fsm

(define init-fsm ; init-fsm: fsm
  '())

(define (add-rule-fsm curstate input newstate output fsm) ; add-rule-fsm: state * input * state * output * fsm -> fsm
  (cons (list curstate input newstate output) fsm))

(define (list-get n l)
  (if (equal? n 0) (car l)
      (list-get (- n 1) (cdr l))))

(define (step-fsm curstate input fsm) ; step-fsm: state * input * fsm -> state X output
  (if (equal? '() fsm) (cons curstate "")
      (let* ([rule (car fsm)]
             [rcurstate (list-get 0 rule)]
             [rinput (list-get 1 rule)]
             [rnewstate (list-get 2 rule)]
             [routput (list-get 3 rule)])
        (if (and (equal? curstate rcurstate) (equal? input rinput))
            (cons rnewstate routput)
            (step-fsm curstate input (cdr fsm))))))

(define (run-fsm curstate inputs fsm) ; run-stem: state * input list * fsm -> state X output list
  (cond [(equal? '() inputs) (cons curstate '())]
        [else
         (let* ([mid (step-fsm curstate (car inputs) fsm)]
                [midstate (car mid)]
                [midoutput (cdr mid)]
                [end (run-fsm midstate (cdr inputs) fsm)]
                [endstate (car end)]
                [endoutputs (cdr end)])
           (cons endstate (cons midoutput endoutputs)))]))

(define fsm1 init-fsm)
(define fsm2 (add-rule-fsm "initial" "insert-coin" "coined" "nothing" fsm1))
(define fsm3 (add-rule-fsm "initial" "push-cola" "initial" "nothing" fsm2))
(define fsm4 (add-rule-fsm "initial" "push-cider" "initial" "nothing" fsm3))
(define fsm5 (add-rule-fsm "initial" "push-return" "initial" "nothing" fsm4))
(define fsm6 (add-rule-fsm "coined" "insert-coin" "coined" "coin" fsm5))
(define fsm7 (add-rule-fsm "coined" "push-cola" "initial" "cola" fsm6))
(define fsm8 (add-rule-fsm "coined" "push-cider" "initial" "cider" fsm7))
(define fsm9 (add-rule-fsm "coined" "push-return" "initial" "coin" fsm8))

(equal?
 (cons "initial" (list "nothing" "cola" "nothing" "coin" "cider" "nothing"))
 (run-fsm "initial" (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider") fsm9))
