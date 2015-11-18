exception TODO;;
                     
type list =
  | Nil
  | Cons of (int * list);;

let rec pprint_list (l: list): string =
  match l with
  | Nil -> "nil"
  | Cons (n, l) -> (string_of_int n) ^ "-" ^ (pprint_list l)  

let l = Cons (0, Cons (2, Cons (1, Nil)));;
let _ = print_endline (pprint_list l);; (* "0-2-1-nil" *)
