open CommonGrade
open Hw6_5

let rec eval_xy (exp:ae) (env:float list): float =
  match exp with
  | CONST i -> (float_of_int i)
  | VAR "x" -> List.nth env 0
  | VAR "y" -> List.nth env 1
  | VAR _ -> List.nth env 2
  | POWER ("x", i) -> (List.nth env 0)**(float_of_int i)
  | POWER ("y", i) -> (List.nth env 1)**(float_of_int i)
  | POWER (_, i) -> (List.nth env 2)**(float_of_int i)
  | TIMES l -> (match l with
		| [] -> 1.0
		| h::t -> (eval_xy h env) *. (eval_xy (TIMES t) env))
  | SUM l -> (match l with
		| [] -> 0.0
		| h::t -> (eval_xy h env) +. (eval_xy (SUM t) env))

let env1 = [1.0; 2.0; 3.0]

let _ = output (fun () ->
		 (int_of_float (eval_xy (diff (CONST 1) "x") env1)) = 0)

let _ = output (fun () ->
		 (int_of_float (eval_xy (diff (SUM [POWER("x",2);CONST 1]) "x") env1)) = 2)

let _ = output (fun () ->
		 (int_of_float (eval_xy (diff (SUM [POWER("y",2);CONST 1]) "y") env1)) = 4)

let _ = output (fun () ->
		 (int_of_float (eval_xy (diff (SUM [POWER("x",2);POWER("y",3)]) "x") env1)) = 2)

let _ = output (fun () ->
		 (int_of_float (eval_xy (diff (SUM [POWER("x",2);TIMES [VAR "x";VAR "y"]]) "x") env1)) = 4)
