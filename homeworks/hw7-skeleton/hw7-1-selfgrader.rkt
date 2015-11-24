#lang racket

(require "common-grade.rkt")
(require "hw7-1.rkt")
(require "sum.rkt")

(define t1 (bstree-make))

(sgoutput (lambda () (equal? #f (bstree-add-elmt t1 3 "v1")) ))
(sgoutput (lambda () (equal? #f (bstree-del-elmt t1 4)) ))
(sgoutput (lambda () (equal? #f (bstree-add-elmt t1 5 "v3")) ))
(sgoutput (lambda () (equal? #t (bstree-del-elmt t1 3)) ))

(sgoutput (lambda () (equal? "v3" (case-sum (lambda (x) x)
                                            (lambda (u) "nothing")
                                            (bstree-find-elmt t1 5)
                                            ))))
(sgoutput (lambda () (equal? "nothing" (case-sum (lambda (x) x)
                                                 (lambda (u) "nothing")
                                                 (bstree-find-elmt t1 3)
                                                 ))))



