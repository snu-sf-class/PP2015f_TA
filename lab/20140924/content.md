# Lab Session, Principles of Programming #

20140924 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/jeehoon.kang), [Yoonseung Kim](http://ropas.snu.ac.kr/~yskim)

### Announcement ###
* If you don't have an account, try ID `pp2014-2`.
- HW1 due is delayed to 20140925 (Thu) 23:59.
- We know that there is a submission problem. If it is the case, change the filename into *.txt*, then submit.

## Recursion Example with List ##
In our opinion, recursion is the heart of theoretical computer science. For example, data structures like trees, heap, or stack is recursive(inductive) data types. Quick sort is a recursive algorithm. Arguably, many interesting examples in computer science has recursive nature. If you are in CS department, you will learn the recursion throughout your college life and deepen your understanding. In this lab session, we will go through some more recursion examples in Racket.

List is an recursive(inductive) data type: a list is either:
- the empty list `'()`; or
- the concatenation `(cons a l)` of an element `a` and a list `l`.
Here in the second case, a list `(cons a l)` contains another list `l`; thus list is recursively(inductively) defined.

You can define useful functions on list by recursion. For example:
- Length:
```racket
(define (length l)
  (if (null? l)
      0
      (+ 1 (length (cdr l)))))
```
Let's analysis `length`. If the given list `l` is empty (`(null? l)`), then `(length l)` is `0`. Otherwise, it is one plus the length of the contained list `(cdr l)`. Thus it matches with our intuition on length of a list. Do some experiment like `(length (list 0 1 2))`.

- Increasing each element of a list:
```racket
(define (incr-list l)
  (if (null? l)
      '()
      (cons (+ 1 (car l)) (incr-list (cdr l)))))
```
Let's analysis `incr-list`. If the given list `l` is empty (`(null? l)`), then `(length l)` is the empty list `'()`. Otherwise, it is the `cons` of [one plus the first element `(car l)`] and [`incr-list` of the contained list `(cdr l)`]. Thus it matches with our intuition on increasing each element of a list. Do some experiment like `(incr-list (list 0 1 2))`.

## Higher-Order Function Example with List ##
Higher-order functions are just functions that:
- whose arguments are *functions*; or
- whose return is *function*.
As function is just ordinary value in Racket, higher-order function is a natural concept in Racket (and other functional programming languages). In this lab session, we will go through some more higher-order function examples in Racket.

- Map
```racket
(define (map f l)
  (if (null? l)
      '()
      (cons (f (car l)) (map f (cdr l)))))
```
Note that `map` looks similar to `incr-list`, except that `incr-list` increases `(car l)`, while `map` applies the given argument function `f` to `(car l)`. In total, `map` transforms each element of `l` by `f`. Obviously, we can define `incr-list` with `map`:
```racket
(define (incr-list' l)
  (map (lambda (x) (+ 1 x)) l))
```

- Filter
```racket
(define (filter test l)
  (if (null? l)
      '()
      (if (test (car l))
          (cons (car l) (filter f (cdr l)))
          (filter f (cdr l)))))
```
`filter` drops out those elements `x` that `(test x)` is not true from `l`. Verify with your intuition that the above code really filters well. Do some experiment like `(filter (lambda (x) (even? x)) (list 0 1 2 3 4 5))`.

## Exercise ##
- Is list even?

Implement ```list-even?``` that, given a list of integers, results in the list of booleans which indicate whether the given integers are even. Fill the blank.
```racket
; you may want to use standard library function (even? n)
(define (list-even? items)
  (if (null? items)
    '()
    (cons 'TODO (even-list 'TODO))))

(list-even? (list 0 1 2 3 4 5 6)) ; '(#t #f #t #f #t #f #t)
```

- Is list even?: `map` version

Implement ```list-even?'``` that works exactly the same with ```list-even?```. Use `map`.
```racket
(define (list-even?' items)
  (map 'TODO items))

(list-even?' (list 0 1 2 3 4 5 6)) ; '(#t #f #t #f #t #f #t)
```

- Has even?

Implement ```has-even?``` that checks if a given list has an even number as follows:
```racket
(has-even '(1 2 3 5)) ; #t
(has-even '(-1 1 3)) ; #f
```

Note that it is convenient to implement `(or-multi l)` that, given a list `l` of booleans, results in the "or" of the elements in `l`. If it is the case, the problem is reduced to:
```racket
(define (has-even l)
  (or-multi (list-even? l)))
```

See [skeleton.rkt](skeleton.rkt) for today's exercises.
