let output (f: unit -> bool): unit =
  print_endline (if f () then "O" else "X")

