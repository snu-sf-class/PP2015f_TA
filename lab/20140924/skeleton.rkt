#lang racket

(define (length l)
  (if (null? l)
      0
      (+ 1 (length (cdr l)))))

(define (incr-list l)
  (if (null? l)
      '()
      (cons (+ 1 (car l)) (incr-list (cdr l)))))

(define (map f l)
  (if (null? l)
      '()
      (cons (f (car l)) (map f (cdr l)))))

(define (incr-list- l)
  (map (lambda (x) (+ 1 x)) l))

(define (filter test l)
  (if (null? l)
      '()
      (if (test (car l))
          (cons (car l) (filter test (cdr l)))
          (filter test (cdr l)))))

; you may want to use standard library function (even? n)
(define (list-even? items)
  (if (null? items)
    '()
    (cons (even? (car l)) (list-even? (cdr l)))))

(list-even? (list 0 1 2 3 4 5 6)) ; '(#t #f #t #f #t #f #t)

(define (list-even?- items)
  (map even? items))

(list-even?- (list 0 1 2 3 4 5 6)) ; '(#t #f #t #f #t #f #t)

(define (or-multi l)
  (if (null? l) #f
      (or (car l) (or-multi (cdr l)))))

(define (has-even l)
  (or-multi (list-even? l)))

(has-even '(1 2 3 5)) ; #t
(has-even '(-1 1 3)) ; #f
