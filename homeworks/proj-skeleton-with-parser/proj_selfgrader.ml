open Syntax
open Proj

(* common grader *)
let output (b:bool) =
  print_endline (if b then "O" else "X")

(* basic test *)
let e1_str = "(if #t (car (cons 1 2)) 4)"
let e1_val = myeval e1_str
let e1_val_str = value_to_string e1_val
let _ = output (e1_val_str = "1")


(* problem 4 *)

let e2_str = "(letrec ((f (lambda (x n) (if (= x 0) n (f (- x 1) (+ n x)))))) (f 999999 0))"
let e2_val = myeval e2_str
let e2_val_str = value_to_string e2_val
let _ = output (e2_val_str = "499999500000")

(* problem 5 *)

let e3_str = "(let ((mp (mcons 1 2))) (mcar mp))"
let e3_val = myeval e3_str
let e3_val_str = value_to_string e3_val
let _ = output (e3_val_str = "1")

let e4_str = "(let  ((mp (mcons 1 2))) (let ((tmp (set-mcdr! mp 3))) (mcdr mp)))"
let e4_val = myeval e4_str
let e4_val_str = value_to_string e4_val
let _ = output (e4_val_str = "3")


(* problem 6 *)

let e5_str = "(with-handlers (((lambda (x) (= x 5)) (lambda (x) (* x 2)))) (cons (+ 1 3) (- 2 (raise 5))))"
let e5_val = myeval e5_str
let e5_val_str = value_to_string e5_val
let _ = output (e5_val_str = "10")


(* problem 7 *)

let e6_str = "(letrec ((fib (lambda (n)"
	       ^ " (if (= n 0) 0 (if (= n 1) 1"
	       ^ " (+ (fib (- n 1)) (fib (- n 2))) ))) )) (fib 10))"
let e6_val = myeval e6_str
let e6_val_str = value_to_string e6_val
let _ = output (e6_val_str = "55")
