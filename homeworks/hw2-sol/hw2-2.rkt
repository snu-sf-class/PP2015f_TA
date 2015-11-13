#lang racket

(provide zipperN)

(define (attach-tail l m)
  (if (null? l) (list m)
    (cons (car l) (attach-tail (cdr l) m))
  ))

(define (zipperN l)
  (if (null? l) '()
    (if (null? (car l)) (zipperN (cdr l))
      (cons (car (car l)) (zipperN (attach-tail (cdr l) (cdr (car l)))))
    )))

