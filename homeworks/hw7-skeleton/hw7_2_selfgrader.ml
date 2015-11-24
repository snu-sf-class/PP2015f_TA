open CommonGrade
open Hw7_2

let _ = output (fun () -> 
  "x" = 
    (SkiLiquid.pprint 
       (SkiLiquid.react 
          (SkiLiquid.M 
             (SkiLiquid.M (SkiLiquid.M (SkiLiquid.S,SkiLiquid.K),
                           SkiLiquid.I),
              SkiLiquid.V "x"))))
)

let _ = output (fun () -> 
  "x" = 
    (SkiLiquid.pprint
       (SkiLiquid.react 
          (SkiLiquid.M 
             (SkiLiquid.M (SkiLiquid.K,(SkiLiquid.V "x")),
              SkiLiquid.M (SkiLiquid.I,(SkiLiquid.V "x"))))))
)

let _ = output (fun () ->
  "(((x y) z) w)" =
    (SkiLiquid.pprint
       (SkiLiquid.M 
          (SkiLiquid.M 
             (SkiLiquid.M (SkiLiquid.V "x",SkiLiquid.V "y"),
              SkiLiquid.V "z"),
           SkiLiquid.V "w")))
)
