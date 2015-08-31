# Lab Session, Principles of Programming #

20141001 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/jeehoon.kang), [Yoonseung Kim](http://ropas.snu.ac.kr/~yskim)

See and download [skeleton.rkt](skeleton.rkt) for this lab session.

## Higher-Order Function, Revisited ##
Implement `circ`, `flip`, `map`, `reduceLeft`, `reduceRight`, `filter`.
- `circ` is the composition of functions, i.e., `((circ g f) x) = (g (f x))`.
- `flip` reorders its arguments, i.e., `((flip f) x y) = (f y x)`.
- `map` transforms each element of a list, i.e., `(map f (list a b c)) = (list (f a) (f b) (f c))`.
- `reduceLeft` reduces the list from the left, i.e., `(reduceLeft r i (list a b c)) = (r (r (r i a) b) c)`.
- `reduceRight` reduces the list from the right, i.e., `(reduceRight r (list a b c)) i = (r a (r b (r c i)))`.
- `filter` filters by a test function, i.e., `(filter test (list a b c)) = (list a c)`, if `(test a)` and `(test c)` are `#t` but `(test b)` is `#f`.

## Type ##
- Type is *a way to specify* an intended specification of values. For example:
    + `int` means an integer;
    + `int -> bool` means a function (`->`) that given an integer (`int`), returns a boolean (`bool`).
    + `(int * bool) -> string` means a function (`->`) that given an integer (`int`) and a boolean (`bool`), return a string (`string`).
- Note that some specifications are not entirely captured in types. What if you want to specify that "Function `f`, given a number `x`, shall return `x` times 2"? It is beyond the scope of types.
- When you design a function, first think what the type of the function should be. This will help you design a proper function.
- When you read a function written by other people (or by yourself long ago), first notice what is the type of the function. This will help you understand the function.

### Examples ###
```racket
(define x 1) ; int
(define y "Jessica") ; string
(define (z x) (string-append "SM and " x)) ; string -> string
(define w (z y)) ; string
(define (a x y) (+ (* x 3) y)) ; int * int -> int
(define (id x) x) ; X -> X
```

### Exercises ###
- Understand types of every definition in [skeleton.rkt](skeleton.rkt).
