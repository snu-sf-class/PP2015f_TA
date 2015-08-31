exception TODO;;
                     
type list =
  | Nil
  | Cons of (int * list);;

let pprint_list (l: list): string =
  raise TODO;;

let l = Cons (0, Cons (2, Cons (1, Nil)));;
let _ = print_endline (pprint_list l);; (* "0-2-1-nil" *)
