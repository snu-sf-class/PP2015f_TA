#lang racket

(require "hw3-3-library.rkt")
(require "hw3-3.rkt")
(require "common-grade.rkt")

; this grader checks whether the generated maze has a unique path
; and the complexitiy of the maze

(define (get-n maze)
  (caar maze))
(define (get-m maze)
  (cdar maze))
(define (get-map maze)
  (cdr maze))

(define (det-next-i i j n)
  (if (even? j)
      (if (= n 0) i (+ i 1))
      (if (= n 0) (- i 1) i)
      ))

(define (get-room cur d)
  (let ([i (car cur)] [j (cdr cur)])
    (cond
      [(equal? d 0) (cons (- i 1) j)]
      [(equal? d 1) (cons (det-next-i i j 0) (+ j 1))]
      [(equal? d 2) (cons (det-next-i i j 1) (+ j 1))]
      [(equal? d 3) (cons (+ i 1) j)]
      [(equal? d 4) (cons (det-next-i i j 1) (- j 1))]
      [else (cons (det-next-i i j 0) (- j 1))]
      )
    ))

(define (valid-room? maze room)
  (let ([i (car room)] [j (cdr room)] [n (caar maze)] [m (cdar maze)])
    (and (<= 0 i) (<= 0 j) (< i n) (< j m))
    ))

(define (is-outer-dir? maze room d)
  (let ([i (car room)] [j (cdr room)] [d-room (get-room room d)])
    (not (valid-room? maze d-room))
    ))

(define (is-open-dir? maze room d)
  (list-ref (list-ref (list-ref (get-map maze) (car room)) (cdr room)) d)
  )

; closing
(define (change-list3 x y z lst elem)
  (define (change-list2 x y lst elem)
    (define (change-list1 x lst elem)
      (if (= x 0)
          (cons elem (cdr lst))
          (cons (car lst) (change-list1 (- x 1) (cdr lst) elem))))
    (if (= x 0)
        (cons (change-list1 y (car lst) elem) (cdr lst))
        (cons (car lst) (change-list2 (- x 1) y (cdr lst) elem))))
  (if (= x 0)
      (cons (change-list2 y z (car lst) elem) (cdr lst))
      (cons (car lst) (change-list3 (- x 1) y z (cdr lst) elem))))

(define (close i j z maze)
  (define n (caar maze))
  (define m (cdar maze))
  (define lst (cdr maze))
  (if (and (<= 0 i) (< i n) (<= 0 j) (< j m) (<= 0 z) (< z 6))
      (cons (cons n m) (change-list3 i j z lst #f))
      maze))

(define (close-dir maze room-dir)
  (let ((room (car room-dir)) (d (cdr room-dir)))
    (close (car room) (cdr room) d maze)
    ))


(define (make-pair l1 l2)
  (define (make-pair-2 a l)
    (if (null? l) '()
        (cons (cons a (car l)) (make-pair-2 a (cdr l)))
        ))
  (if (null? l1) '()
      (append (make-pair-2 (car l1) l2) (make-pair (cdr l1) l2))
      ))

(define (make-list f n)
  (if (= n 0) '()
      (cons f (make-list (+ f 1) (- n 1)))
      ))

(define (collect-open-room maze l)
  (if (null? l) '()
      (let ((room (caar l)) (d (cdar l)) (tail (collect-open-room maze (cdr l))) )
        (if (and (is-open-dir? maze room d) (is-outer-dir? maze room d))
            (cons (cons room d) tail)
            tail)
        )))

(define (find-start maze)
  (let ((n (get-n maze)) (m (get-m maze)))
    (let ((test-input (make-pair (make-pair '(0) (make-list 0 m)) (make-list 0 6))))
      (collect-open-room maze test-input)
      )))

(define (find-end maze)
  (let ((n (get-n maze)) (m (get-m maze)))
    (let ((test-input (make-pair (make-pair (list (- n 1)) (make-list 0 m)) (make-list 0 6))))
      (collect-open-room maze test-input)
      )))

(define (count-paths maze is-path-found? cur stack end res-pair) ;res-pair is (path, step-cnt), or 'not-unique
  (define (check-found r)
    (if (pair? r)
        (not (null? (car r)))
        #f)
    )
  (define (not-in rm stk)
    (if (null? stk) #t
        (if (equal? rm (car stk)) #f (not-in rm (cdr stk)))
        ))
  (define (inc-res-pair res) (cons (car res) (+ (cdr res) 1)))
  (define (do-dfs m isf? c stk d en res)
    (cond
      [(equal? res 'not-unique) 'not-unique]
      [(= d 6) (cons (car res) (+ (cdr res) 1))]
      [(and (is-open-dir? m c d) (not-in (get-room c d) stk))
       (let
           ((resn (count-paths m (check-found res) (get-room c d) (cons c stk) end (inc-res-pair res))))
         (do-dfs m (check-found resn) c stk (+ d 1) en resn)
         )]
      [else
       (do-dfs m isf? c stk (+ d 1) en res)]
      ))
  (if (equal? cur end)
      (if is-path-found? 'not-unique (cons (cons cur stack) (+ (cdr res-pair) 1)))
      (do-dfs maze is-path-found? cur stack 0 end res-pair)
      )
    ;)
    )

(define (test-path maze)
  (let ([lst (find-start maze)] [len (find-end maze)])
    (if (and (= (length lst) 1) (= (length len) 1))
        (let ([st (car lst)] [en (car len)])
          
          (count-paths (close-dir maze st) #f (car st) '() (car en) (cons '() 0))
          )
        #f
        )
    ))

(define (evaluate maze)
  (let ((res (test-path maze)))
    (if (pair? res)
        (if (null? (car res))
            (cons 'fail 0)
            (cons 'unique (- (cdr res) (length (car res))))
            )
        (if (equal? res 'not-unique)
            (cons 'not-unique 0)
            (cons 'error 0)
            )
        )))

(printf "testing a maze which doesn't have a path from start to end (0 pts):\n")
(define maze-nopath
  '((3 . 2)
    ((#f #t #f #f #f #f) (#t #f #f #t #t #f))
    ((#f #t #f #t #f #f) (#t #f #f #f #t #f))
    ((#t #f #f #f #f #f) (#f #f #f #t #f #f)))
  )
(evaluate maze-nopath)

(printf "testing a maze which have multiple paths (1 pts):\n")
(define maze-multiplepath
  '((3 . 2)
    ((#f #t #f #f #f #f) (#t #f #f #t #t #f))
    ((#f #t #f #t #f #f) (#t #f #f #t #t #f))
    ((#t #t #f #f #f #f) (#t #f #f #t #t #f)))
  )

(evaluate maze-multiplepath)

(printf "actual testing:\n")
(define mz1 (mazeGen 3 3))
(define mz2 (mazeGen 8 5))
(define mz3 (mazeGen 15 15))

(evaluate mz1)
(evaluate mz2)
(evaluate mz3)
