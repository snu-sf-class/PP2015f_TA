#lang racket

(require racket/match)
(require "common-grade.rkt")
(require "hw4-1.rkt")

(define (lookup key m)
  (match
   m
   ['() (raise "lookup failed")]
   [(cons (cons k v) rest)
    (if (equal? key k)
        v
        (lookup key rest))]))

(define (sum-list l)
  (define (sum-list-acc l acc)
    (match
     l
     ['() acc]
     [(cons x r) (sum-list-acc r (+ x acc))]))
  (sum-list-acc l 0))

(define (prefix? lhs rhs)
  (match
   lhs
   ['() #t]
   [(cons lhd ltl)
    (match
     rhs
     ['() #f]
     [(cons rhd rtl)
      (and (equal? lhd rhd) (prefix? ltl rtl))])]))

(define (forall? pred l)
  (match
   l
   ['() #t]
   [(cons hd tl) (and (pred hd) (forall? pred tl))]))

(define (prefix-list? str l)
  (forall? (lambda (x) (not (or (prefix? str x) (prefix? x str)))) l))

(define (prefixfree? l)
  (match
   l
   ['() #t]
   [(cons hd tl)
    (and (prefix-list? hd tl) (prefixfree? tl))]))

(define (wellformed? frequencies codes)
  (and
   (forall?
    (lambda (kf)
      (with-handlers
       ([(lambda (exn) #t) #f])
       (or
        (equal? (cdr kf) 0)
        (begin
          (lookup (car kf) codes)
          #t))))
    frequencies)
   (prefixfree? (map cdr codes))))

(define (compute-score frequencies codes)
  (sum-list
   (map
    (lambda (kc)
      (let* ([k (car kc)]
             [c (cdr kc)]
             [f (lookup k frequencies)])
        (* f (length c))))
    codes)))

(sgoutput
 (lambda ()
   (let* ([frequencies (list (cons "a" 5) (cons "b" 1) (cons "c" 1) (cons "d" 1))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 13 score)))))

(sgoutput
 (lambda ()
   (let* ([frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 36 score)))))

(sgoutput
 (lambda ()
   (let* ([frequencies (list (cons "a" 3) (cons "b" 4) (cons "c" 5) (cons "d" 6) (cons "e" 0))]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 36 score)))))

(sgoutput
 (lambda ()
   (let* ([frequencies '()]
          [codes (vlencode frequencies)]
          [wf? (wellformed? frequencies codes)]
          [score (compute-score frequencies codes)])
     (and wf? (equal? 0 score)))))
