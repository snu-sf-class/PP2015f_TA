# Lab Session, Principles of Programming #

20141008 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/jeehoon.kang), [Yoonseung Kim](http://ropas.snu.ac.kr/~yskim)

## Termination of Program ##

The following function, `fac` to compute factorial, terminates:
```racket
(define (fac n) 
   (printf "~s~n" n)
   (if (= n 0) 1 (* n (fac (- n 1)))))
```

To check that the factorial function terminates, it prints a
*decreasing number* by ```printf``` in the function.  The decreasing
number should satisfy the following conditions:

- it must decrease in the every execution steps.
- it must be bigger than or equal to 0.

The `my-gcd` function below also terminates.  To show the function
terminates explicitly, fill in the `'TODO`.  You may assume that the
inputs of the `my-gcd` function are bigger than or equal to 0.

```racket
(define (my-gcd n m)
  (printf "~s~n" (+ n m))
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my-gcd n (- m n)))
        (else (my-gcd (- n m) m))))
```

## How to troubleshout? ##

Today, we will digress a little to learn how to resolve problems you
will encounter during programming. This is not particularly pertaining
to Racket, but the general advice will apply to many situations.

### Audience ###
- Those who suffered from not knowing how to implement something for
  overnight. For example, you may want to know how to convert integer
  into string.
- Those who suffered from wrong answer for overnight.
- Those who suffered from Principles of Programming (..)

This guide does not aim to resolve all your problems, but to resolve
your problems generally related to languages. I hope this really helps
you.

### Implementation Scenario ###
Suppose you want to concatenate all numbers from `1` to `n` as follows:
```racket
(equal? "1234567891011" (acc 11))
```

So you begin to define `acc` as follows:
```racket
(define (acc n)
  (if (equal? n 0) ""
      'TODO))
```

Now `'TODO` should be the concatenation of `(acc (- n 1))` and
`n`. However, types mismatch: the former is a string, while the latter
is an integer. The result should be a string. So you have to convert
an integer into a string. But how?

Don't panic, and just google
["racket convert from integer to string"](https://www.google.com/?q=racket%20convert%20from%20integer%20to%20string). The
first result is the
[racket documentation on string](http://docs.racket-lang.org/reference/strings.html). You
can easily find "Converting Values to Strings", which is exactly you
wanted to find. Then your second try is as follows:
```racket
(define (acc n)
  (if (equal? n 0) ""
      ('TODO (acc (- n 1)) (number->string n))))
```

Now you have to concatenate two strings. But how? Don't panic, and
just google
["racket concatenate strings"](https://www.google.co.kr/search?q=racket+concatenate+strings). The
first result is, as usual(!),
[racket documentation on string](http://docs.racket-lang.org/reference/strings.html). You
can easily find "string-append", which is exactly you wanted to
find. Then your solution is as follows:
```racket
(define (acc n)
  (if (equal? n 0) ""
      (string-append (acc (- n 1)) (number->string n))))
```

Now you solve your problem!

### Error Message Scenario ###
Suppose you wrote down the following program:
```racket
(define (acc n)
  (if (equal? n 0) ""
      (cons (acc (- n 1)) (number->string n))))
```

Then the result of `(acc 11)` should be:
```racket
'((((((((((("" . "1") . "2") . "3")
         .
         "4")
        .
        "5")
       .
       "6")
      .
      "7")
     .
     "8")
    .
    "9")
   .
   "10")
  .
  "11")
```
Oh my god. What happened?! (You may know the answer, but pretend not
to know for now!)

First, `11` is an input too large. Let's see what happens for `(acc
0)`. It results in `""`, which is (largely) what we wanted. Then let's
see what happens for `(acc 1)`. It results in `'("" . "1")`, which is
NOT what we wanted! *Lessen: find the smallest example you can find.*

Second, let's think of what happens here. `acc` is a recursive
function, for reasoning on `(acc 1)`, it may help to replace `n` by
`1` at the definition of `acc`. Then we have:
```racket
(if (equal? 1 0) ""
    (cons (acc (- 1 1)) (number->string 1)))
```
Then we can simplify further. Since `1` does not equal to `0`, the
above expression is equivalent to:
```racket
(cons (acc (- 1 1)) (number->string 1))
```
Then to:
```racket
(cons "" "1")
```
Oh, now it is clear that we wrongly write `cons` where we should write
`string-append`! Correct it, then we will see the right answer!
*Lesson: To troubleshout, concretely reason on the small example you
found.*

### Lessons Learned ###
- If you don't know how to do something:
    + If you don't know something, google it.
    + To better google, you may have to formulate a good question.
        * Learn English. English is the most important language in computer science (..)
        * Learn what is the common question in computer science.
- If you did something, but that goes wrong:
    + If you can google on it, do it (error message, etc).
    + Find the core of your problem (the smallest example, etc).
    + Reason on the core of your problem.
- If you are not familiar with Racket enough to follow the logic in
  this example, you may have to learn Racket basics first. Go through
  lab session materials first, and then try again.
