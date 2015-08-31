type tree =
  | Leaf of int
  | Branch of (tree * tree);;

let rec pprint_tree (t: tree): string =
  match t with
  | Leaf v -> string_of_int v
  | Branch (l, r) ->
     "(" ^ (pprint_tree l) ^ " " ^ (pprint_tree r) ^ ")";;

let ex = Branch (Branch (Branch (Leaf 0, Leaf 1), Leaf 2), Branch (Leaf 3, Leaf 4));;
let _ = print_endline (pprint_tree ex);;
