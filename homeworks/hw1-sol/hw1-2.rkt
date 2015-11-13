#lang racket

(provide crazy2add)

(define (crazys2num a)
  (if (equal? a 'p) 1
      (if (equal? a 'n) -1 0)
      ))

(define (cr-cur n)
  (if (even? n) 'z
      (if (< 0 n) 'p 'n)))

(define (cr-carry n)
  (if (< 1 n) 'p
      (if (> -1 n) 'n 'z)))

(define (num2crazyp n)
  (cons (cr-cur n) (cr-carry n)))

(define (add3 a b c)
  (let ((x (crazys2num a)) (y (crazys2num b)) (z (crazys2num c)))
    (num2crazyp (+ x y z))
    ))
    
(define (get-head c)
  (if (null? c) 'z
      (car c)))

(define (get-tail c)
  (if (null? c) null
      (cdr c)))

(define (crazy2add-intl lhs rhs carry)
  (if (and (and (null? lhs) (null? rhs)) (equal? carry 'z))
      (cons 'z null)
      (let ((lh (get-head lhs)) (lt (get-tail lhs)) (rh (get-head rhs)) (rt (get-tail rhs)))
        (let ((p (add3 lh rh carry)))
          (cons (car p)
                (crazy2add-intl lt rt (cdr p)))
          ))))

(define (crazy2add lhs rhs)
  (crazy2add-intl lhs rhs 'z)
  )
