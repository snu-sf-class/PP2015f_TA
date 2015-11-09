#lang racket

(define (create-counter)
  (define n 0)
  (define (inc)
    (set! n (+ n 1))
    n)
  inc)

(define c (create-counter))
(printf "~s~n" (c)) ; 1
(printf "~s~n" (c)) ; 2
(printf "~s~n" (c)) ; 3
(printf "~s~n" (c)) ; 4
(printf "~s~n" (c)) ; 5

(define d (create-counter))
(printf "~s~n" (d)) ; 1
(printf "~s~n" (d)) ; 2
(printf "~s~n" (d)) ; 3
(printf "~s~n" (d)) ; 4
(printf "~s~n" (d)) ; 5
