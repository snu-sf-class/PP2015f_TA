#lang racket

(provide sgoutput output-raw)

(define (sgoutput p)
  (with-handlers
   ([(lambda (exn) #t) (lambda (exn) (printf "X (error)\n"))])
   (printf (if (equal? (p) #t) "O\n" "X\n"))))

(define (output-raw p)
  (printf (if (equal? (p) #t) "O\n" "X\n")))
