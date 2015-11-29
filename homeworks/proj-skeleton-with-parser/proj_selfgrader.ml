open Syntax
open Proj

let e1_str = "(if #t (car (cons 1 2)) 4)"
let e1_val = myeval e1_str
let e1_val_str = value_to_string e1_val

let _ = print_endline e1_val_str

let _ = if (e1_val_str = "1") then
    print_endline "O"
  else
    print_endline "X"
