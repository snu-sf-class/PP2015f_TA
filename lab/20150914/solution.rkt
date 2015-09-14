(define (sign x)
  (if (< x 0) "-"
      (if (> x 0) "+")
      "0"))
(sign 0) ; "0"
(sign 1) ; "+"
(sign -1) ; "-"

(define (absolut x)
  (if (< x 0) (- x) x))
(absolut 0) ; 0
(absolut 1) ; 1
(absolut -1) ; 1

(define (maxima lst)
  (if (equal? lst nil)
      0
      (max (car lst) (maxima (cdr list)))))
(maxima '()) ; 0
(maxima '(1 5 2 4 3)) ; 5
(maxima '(7 3 1)) ; 7
