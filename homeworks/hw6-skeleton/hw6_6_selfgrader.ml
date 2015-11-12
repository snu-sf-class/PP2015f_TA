open CommonGrade
open Hw6_6

let m1 = AREA ("a", STATION "a")

let m2 = AREA ("a", AREA("a", STATION "a"))

let m3 = AREA("a", CONNECT(STATION "a", AREA("b", STATION "a")))

let m4 = AREA ("a", STATION "b")

let m5 = AREA("a", CONNECT(STATION "a",
			   AREA("b", STATION "c")))

let _ = output (fun () -> (checkMetro m1 = true))
let _ = output (fun () -> (checkMetro m2 = true))
let _ = output (fun () -> (checkMetro m3 = true))
let _ = output (fun () -> (checkMetro m4 = false))
let _ = output (fun () -> (checkMetro m5 = false))

