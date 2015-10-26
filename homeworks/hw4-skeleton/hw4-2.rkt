#lang racket


; We auto-grade only "react" function; other functions are not
; auto-graded. However, S, K, I, v, and a are required for
; grading. See hw4-2-grade.rkt for more information.
(provide react S K I v a)


; Implement react. 
;
; In the document, react has the type solution -> void.
; However, implement react: solution -> string for ease of grading.
; Return the string of the given solution printed by pprint.
;
; See hw4-2-grade.rkt for more information on what the returned string should look like.
; In short,
; S prints "S";
; K prints "K";
; I prints "I";
; variable x prints "x";
; tuple (E F) prints "(" + E + " " + F + ")".

(define (react e) ; execute: solution -> string
  (pprint 
   'TODO
   ))

(define S ; S: solution
  'TODO)
(define K ; K: solution
  'TODO)
(define I ; I: solution
  'TODO)
(define (v str) ; v: string -> solution
  'TODO)
(define (a lhs rhs) ; a: solution * solution -> solution
  'TODO)


; You may need the following tree interface.

(define (isS? e) ; isS?: solution -> bool
  'TODO)
(define (isK? e) ; isK?: solution -> bool
  'TODO)
(define (isI? e) ; isI?: solution -> bool
  'TODO)
(define (isv? e) ; isv?: solution -> bool
  'TODO)
(define (isa? e) ; isa?: solution -> bool
  'TODO)
(define (var e) ; var: solution -> string
  'TODO)
(define (al e) ; al: solution -> solution
  'TODO)
(define (ar e) ; ar: solution -> solution
  'TODO)
(define (pprint e) ; pprint: solution -> string
  'TODO)
