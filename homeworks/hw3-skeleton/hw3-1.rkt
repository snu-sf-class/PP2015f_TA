# lang racket
; not for execution
; write a type of each expression

(define (sigma lower upper)
  (lambda (f)
    (define (loop n)
      (if (> n upper) 0
          (+ (f n) (loop (+ n 1)))))
    (loop lower)
    )
  )

(define (generic-sum lower upper f larger base op inc)
  (if (larger lower upper) base
      (op (f lower)
          (generic-sum (inc lower) upper f larger base op inc))
      )
  )

(define (map f l)
  (if (null? l) '()
      (cons (f (car l)) (map f (cdr l)))
      )
  )

(define (reduce l op init)
  (if (null? l) init
      (op (car l) (reduce (cdr l) op init))
      )
  )

(define (map-reduce f l op init)
  (reduce (map f l) op init)
  )
