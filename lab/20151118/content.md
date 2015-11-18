# Lab Session, Principles of Programming #

20141119 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/~jeehoon.kang),
[Yoonseung Kim](http://sf.snu.ac.kr/~yoonseung.kim)

We are going to learn the advantage of static typing.
You will use OCaml in this session.

### Type Error ###

Let's see [treeWrong.rkt](treeWrong.rkt) first.
It contains a binary tree structure in which integer values are stored
only in leaves. 

If you try to run the code, you will see this error message:

```
string-append: contract violation
  expected: string?
  given: 0
  argument position: 2nd
  other arguments...:
   "("
   " "
   1
   ")"
  context...:
   /Users/idiothinker/Works/pp-material/20131106/treeWrong.rkt: [running body]
```

This message says, ```0``` is given where a string is expected.
Correct this code to make it run without errors.
(Hint: the problem is in ```(leaf-value t)``` at the 35th line.


### Static Typing ###

From the example above, you must have complaints to Racket.

* This kind of error is too obvious.
* It is obvious in the sense that ```pprint-tree``` should return a ```string```, but obvious ```(leaf-value t)``` is not a string.
* We want an error message like this: ```type error: (leaf-value t)
  is an int, but is expected to be a string.```

The solution is, to use a language which supports static typing!
So we are going to use OCaml.

### OCaml ###

Download [tree.ml](tree.ml)
and drag-and-drop the file into
[try.ocamlpro.com](http://try.ocamlpro.com).

Or, you can use OCaml in your PC.

Let's look at the code line by line.

```ocaml
type tree =
  | Leaf of int
  | Branch of (tree * tree);;
```

This defines a new type ```tree```. Unlike Racket, we can define
types explicitly, and we should do it. the ```tree``` type consists
of two kinds, ```Leaf``` (which contains an integer) and ```Branch```
(which contains two subtrees).


```ocaml
let rec pprint_tree (t: tree): string =
  match t with
  | Leaf v -> string_of_int v
  | Branch (l, r) ->
     "(" ^ (pprint_tree l) ^ " " ^ (pprint_tree r) ^ ")";;
```

```match ??? with``` is the most important part.
In Racket we did like ```(if (is-branch? t) ??? ???)```.
In OCaml, we use ```match``` when we want to do different jobs
for different cases.

Other than that, we can see ```string_of_int``` changes an integer to string,
and ```^``` appends strings.

```ocaml
let ex = Branch (Branch (Branch (Leaf 0, Leaf 1), Leaf 2), Branch (Leaf 3, Leaf 4));;
let _ = print_endline (pprint_tree ex);;
```

Ocaml has several advantages.

* The code is more concise than Racket.
* It finds out all type errors before execution.
Try execute [treeWrong.ml](treeWrong.ml). You will see a helpful message like: 
`File "treeWrong.ml",
line 7, characters 14-15: Error: This expression has type int but an
expression was expected of type string`

### Ocaml Programming ###

After studying tree.ml, complete [list.ml](list.ml).

### OCaml Development Environment ###

We recommend the following environments.

* We will grade code with OCaml version 4.01.
* [Download](http://caml.inria.fr/download.en.html) 
* For Linux Users, Emacs/Vim + make will be good.
  + There is a useful plugin for Emacs
    [Tuareg](http://www.emacswiki.org/emacs/TuaregMode)
* Otherwise, [Eclipse](http://eclipse.org) +
  [OcaIDE](http://www.algo-prog.info/ocaide/) is good.
  If you want to use this, consult with the
  [previous ocaml tutorial](http://ropas.snu.ac.kr/~ta/4190.210/12/practice/ocaml_tutorial.pdf).
