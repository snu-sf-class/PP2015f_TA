exception TODO

type metro = STATION of name
	   | AREA of name * metro
	   | CONNECT of metro * metro
 and name = string

let rec checkMetro (m:metro): bool =
  raise TODO
