exception TODO

type matcher =
  | Empty
  | Char of int
  | Append of (matcher * matcher)
  | Union of (matcher * matcher)
  | Star of matcher

type string = int list

(* See Figure 1 (bottom) *)
let rec dagger (m:matcher) (char:int) : matcher list =
  match m with
  | Empty -> []
  | _ -> raise TODO

(* See Figure 1 (top) *)
let rec match_string (m:matcher) (s:string) : bool =
  match m with
  | Empty -> s = []
  | _ -> raise TODO

let _ = print_endline (string_of_bool (match_string (Append (Char 3, Char 4)) [4])) (* true *)
