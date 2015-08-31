#lang racket

;;; complex number

(define (is-c-rect? c) ; c-rect -> bool
  'TODO)

(define (c-rect-make x y) ; number * number -> c-rect
  'TODO)

(define c-rect-real ; c-rect -> number
  'TODO)

(define c-rect-imaginary ; c-rect -> number
  'TODO)


(define (is-c-polar? c) ; c-polar -> bool
  'TODO)

(define (c-polar-make theta r) ; number * number -> c-polar
  'TODO)

(define c-polar-angle ; c-polar -> number
  'TODO)

(define c-polar-radius ; c-polar -> number
  'TODO)


(define (c-real c) ; complex -> number
  (if (is-c-rect? c)
      (c-rect-real c)
      (* (cos (c-polar-angle c)) (c-polar-radius c))))

(define (c-imaginary c) ; complex -> number
  'TODO)

(define (c-angle c) ; complex -> number
  'TODO)

(define (c-radius c) ; complex -> number
  'TODO) 

(define (c-conjugate c) ; complex -> complex
  'TODO)

(define c1 (c-rect-make 1 2))
(define c2 (c-rect-make 3 4))
(define c3 (c-polar-make 0.7 3))
(define c4 (c-polar-make 0.5 2))

(c-rect-real c1) ; 1
(c-rect-imaginary c2) ; 4
(c-polar-angle c3) ; 0.7
(c-polar-radius c4) ; 2
(is-c-rect? c1) ; #t
(is-c-rect? c3) ; #f
(is-c-polar? c4) ; #t
(c-real c1) ; 1
(c-real c3) ; 2.2945265618534654 = (* 3 (cos 0.7))
(c-imaginary c2) ; 4
(c-imaginary c4) ; 0.958851077208406 = (* 2 (sin 0.5))
(c-angle c1) ; 1.1071487177940904;(atan 2 1)
(c-angle c3) ; 0.7
(c-radius c2) ; 5 = (sqrt (+ (expt 3 2) (expt 4 2)))
(c-radius c4) ; 2

(define c5 (c-conjugate c1))
(define c6 (c-conjugate c3))

(c-real c5) ; 1
(c-imaginary c5) ; -2
(c-real c6) ; 2.2945265618534654
(c-imaginary c6) ; -1.932653061713073
