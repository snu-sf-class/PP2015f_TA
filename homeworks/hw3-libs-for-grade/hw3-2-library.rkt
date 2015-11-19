#lang racket

(provide can-enter same-room? empty-set add-element is-member? is-subset?)

(define (can-enter room maze) 
  (map (lambda (x) (cons 'r x))
       (list-ref (cddr maze) (cdr room)))
  )

(define same-room? equal?) 

(define empty-set (cons 'set '()) ) 
(define (add-element e s)
	(cons 'set (cons e (cdr s)))
  )

(define (is-member? room roomset) 
  (cond ((null? (cdr roomset)) #f) 
        ((equal? room (cadr roomset)) #t) 
        (else (is-member? room (cons 'set (cddr roomset)))))
  )

(define (is-subset? rs1 rs2) 
  (cond ((null? (cdr rs1)) #t) 
        ((is-member? (cadr rs1) rs2) (is-subset? (cddr rs1) rs2)) 
        (else #f))) 
