#lang racket

(provide can-enter same-room? empty-set add-element is-member? is-subset?)

(define (can-enter maze room) 
  (list-ref (cdr maze) room)) 

(define same-room? equal?) 

(define empty-set '()) 
(define add-element cons) 
(define (is-member? room roomset) 
  (cond ((null? roomset) #f) 
        ((equal? room (car roomset)) #t) 
        (else (is-member? room (cdr roomset))))) 

(define (is-subset? rs1 rs2) 
  (cond ((null? rs1) #t) 
        ((is-member? (car rs1) rs2) (is-subset? (cdr rs1) rs2)) 
        (else #f))) 
