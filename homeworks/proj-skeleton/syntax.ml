(* DO NOT TOUCH anything *)

type const_t =
  | CINT of int
  | CTRUE
  | CFALSE
  | CNULL

type var_t = string

type exp_t =
  | CONST of const_t
  | VAR of var_t
  | IF of (exp_t * exp_t * exp_t)
  | CONS of (exp_t * exp_t)
  | CAR of exp_t
  | CDR of exp_t
  | LAMBDA of (var_t list * exp_t)
  | APP of (exp_t * exp_t list)
  | LET of (binding_t list * exp_t)
  | LETREC of (binding_t list * exp_t)
  | ADD of (exp_t * exp_t)
  | SUB of (exp_t * exp_t)
  | MUL of (exp_t * exp_t)
  | EQ of (exp_t * exp_t)
  | LT of (exp_t * exp_t)
  | GT of (exp_t * exp_t)
  (* mutable *)
  | MCONS of (exp_t * exp_t)
  | MCAR of exp_t
  | MCDR of exp_t
  | SETMCAR of (exp_t * exp_t)
  | SETMCDR of (exp_t * exp_t)
  (* exception *)
  | RAISE of exp_t
  | HANDLERS of (hdl_binding_t list * exp_t)

 and binding_t = var_t * exp_t
 and hdl_binding_t = exp_t * exp_t

(* The functions below are not necessary, *)
(* but you can use them for debugging. *)

let const_to_string (c:const_t): string =
  match c with
  | CINT n -> string_of_int n
  | CTRUE -> "#t"
  | CFALSE -> "#f"
  | CNULL -> "'()"

let rec exp_to_string (exp:exp_t): string =
  match exp with
  | CONST c -> const_to_string c
  | VAR x -> x
  | IF (e1, e2, e3) -> "(if "^(exp_to_string e1)^" "
    ^(exp_to_string e2)^" "^(exp_to_string e3)^")"
  | CONS (e1, e2) -> "(cons "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | CAR e1 -> "(car "^(exp_to_string e1)^")"
  | CDR e1 -> "(cdr "^(exp_to_string e1)^")"
  | LAMBDA (vl, e1) -> "(lambda ("^(varlist_to_string vl)^") "^(exp_to_string e1)^")"
  | APP (e1, el) -> "("^(exp_to_string e1)^(explist_to_string el)^")"
  | LET (bl, e1) -> "(let ("^(lb_to_string bl)^") "^(exp_to_string e1)^")"
  | LETREC (bl, e1) -> "(letrec ("^(lb_to_string bl)^") "^(exp_to_string e1)^")"
  | ADD (e1, e2) -> "(+ "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | SUB (e1, e2) -> "(- "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | MUL (e1, e2) -> "(* "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | EQ (e1, e2) -> "(- "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | LT (e1, e2) -> "(< "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | GT (e1, e2) -> "(> "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | MCONS (e1, e2) -> "(mcons "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | MCAR e1 -> "(mcar "^(exp_to_string e1)^")"
  | MCDR e1 -> "(mcdr "^(exp_to_string e1)^")"
  | SETMCAR (e1, e2) -> "(set-mcar! "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | SETMCDR (e1, e2) -> "(set-mcdr! "^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | RAISE e1 -> "(raise "^(exp_to_string e1)^")"
  | HANDLERS (hl, e1) -> "(with-handlers ("^(hdl_to_string hl)^") "^(exp_to_string e1)^")"

and explist_to_string (el: exp_t list): string =
  match el with
  | [] -> ""
  | e::elt -> " "^(exp_to_string e)^(explist_to_string elt)

and varlist_to_string (vl: var_t list): string =
  match vl with
  | [] -> ""
  | [x] -> x
  | x::vlt -> x^" "^(varlist_to_string vlt)

and lb_to_string (bl: binding_t list): string =
  match bl with
  | [] -> ""
  | [(x, e)] -> "("^x^" "^(exp_to_string e)^")"
  | (x, e)::blt -> "("^x^" "^(exp_to_string e)^") "^(lb_to_string blt)

and hdl_to_string (hl: hdl_binding_t list): string =
  match hl with
  | [] -> ""
  | [(e1, e2)] -> "("^(exp_to_string e1)^" "^(exp_to_string e2)^")"
  | (e1, e2)::hlt -> "("^(exp_to_string e1)^" "^(exp_to_string e2)^") "^(hdl_to_string hlt)
