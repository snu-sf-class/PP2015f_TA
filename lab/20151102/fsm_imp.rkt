#lang racket

; imperative programming

(define fsm null)
(define state "initial")

(define (init-fsm) ; init-fsm: unit
  (set! fsm null)
  (set! state "initial"))

(define (add-rule-fsm curstate input newstate output) ; add-rule-fsm: state * input * state * output -> unit
  (set! fsm (cons (cons (cons curstate input) (cons newstate output)) fsm)))

(define (step-fsm input) ; step-fsm: input -> output
  (let ((input-state state)
        (output "nothing"))
    (for ((rule fsm))
         (raise "TODO"))
    output))

(define (run-fsm inputs) ; run-fsm: input list -> output list
  (let ((output-list null))
    (for ((input inputs))
         (raise "TODO"))
    output-list))

(init-fsm)
(add-rule-fsm "initial" "insert-coin" "coined" "nothing")
(add-rule-fsm "initial" "push-cola" "initial" "nothing")
(add-rule-fsm "initial" "push-cider" "initial" "nothing")
(add-rule-fsm "initial" "push-return" "initial" "nothing")
(add-rule-fsm "coined" "insert-coin" "coined" "coin")
(add-rule-fsm "coined" "push-cola" "initial" "cola")
(add-rule-fsm "coined" "push-cider" "initial" "cider")
(add-rule-fsm "coined" "push-return" "initial" "coin")

(and
 (equal? "initial" state)
 (equal?
  (list "nothing" "cola" "nothing" "coin" "cider" "nothing")
  (run-fsm (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider"))))
