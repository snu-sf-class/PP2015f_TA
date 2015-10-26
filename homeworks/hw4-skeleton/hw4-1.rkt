#lang racket


; We auto-grade only vlencode function; other functions are not
; auto-graded.
; If this "provide" statement is omitted, your submission will be graded 0.
(provide vlencode)


(define (vlencode frequencies) ; vlencode: (string X int) list -> (string X (int list)) list
  'TODO
  )
  
;  The output of vlencode should follow the following form.
;  The exact code for each word can be different from this example,
;   but the length of the code for each word should be the same.
;  
;   (define frequencies (list (cons "a" 5) (cons "b" 1) (cons "c" 1) (cons "d" 1)))
;   (vlencode frequencies) =
;     (list (cons "a" (list 0)) (cons "b" (list 1 0)) (cons "c" (list 1 1 0)) (cons "d" (list 1 1 1)))
;
;   (define frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6)))
;   (vlencode frequencies) =
;     (list (cons "a" (list 0 0)) (cons "b" (list 0 1)) (cons "c" (list 1 0)) (cons "d" (list 1 1)))
;
;   (define frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6) (cons "e" 0)))
;   (vlencode frequencies) =
;     (list (cons "a" (list 0 0)) (cons "b" (list 0 1)) (cons "c" (list 1 0)) (cons "d" (list 1 1)))
;



; You may need the following tree interface (but not mandatory.)

(define (leaf str val) ; leaf: string * value -> tree
  'TODO)

(define (node lsub val rsub) ; node: tree * value * tree -> tree
  'TODO)

(define (isleaf? tree) ; isleaf?: tree -> bool
  'TODO)

(define (leftsub tree) ; leftsub: tree -> tree
  'TODO)

(define (rightsub tree) ; rightsub: tree -> tree
  'TODO)

(define (leafval tree) ; leafval: tree -> value
  'TODO)

(define (leafstr tree) ; leftstr: tree -> string
  'TODO)

(define (rootval tree) ; rootval: tree -> value
  'TODO)

