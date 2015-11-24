open CommonGrade
open Hw8_4

module A  = BasicFrame (struct let design = TURTLE end)
let _ = output (fun () -> A.box = BOX (NW, TURTLE))
let _ = output (fun () -> A.rotate A.box = BOX (NE, TURTLE))

module B  = BasicFrame (struct let design = WAVE end)
let _ = output (fun () -> B.box = BOX (NW, WAVE))
let _ = output (fun () -> B.rotate B.box = BOX (NE, WAVE))

module A' = Rotate (A)
let _ = output (fun () -> A'.box = BOX (NE, TURTLE))
let _ = output (fun () -> A'.rotate A'.box = BOX (SE, TURTLE))

module A''= Rotate (A')
let _ = output (fun () -> A''.box = BOX (SE, TURTLE))
let _ = output (fun () -> A''.rotate A''.box = BOX (SW, TURTLE))

module B' = Rotate (B)
let _ = output (fun () -> B'.box = BOX (NE, WAVE))
let _ = output (fun () -> B'.rotate B'.box = BOX (SE, WAVE))

module B''= Rotate (B')
let _ = output (fun () -> B''.box = BOX (SE, WAVE))
let _ = output (fun () -> B''.rotate B''.box = BOX (SW, WAVE))

module A4 = Glue (A) (B) (A') (B')
let _ = output (fun () -> A4.box = 
    GLUED (BOX (NW, TURTLE), BOX (NW, WAVE), BOX (NE, TURTLE), BOX (NE, WAVE)))
let _ = output (fun () -> A4.rotate A4.box = 
    GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), BOX (NE, WAVE), BOX (SE, TURTLE)))

module B4 = Glue (A) (A') (B) (B')
let _ = output (fun () -> B4.box = 
    GLUED (BOX (NW, TURTLE), BOX (NE, TURTLE), BOX (NW, WAVE), BOX (NE, WAVE)))
let _ = output (fun () -> B4.rotate B4.box = 
    GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), BOX (SE, TURTLE), BOX (NE, WAVE)))

module A4'= Rotate (A4)
let _ = output (fun () -> A4'.box = 
    GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), BOX (NE, WAVE), BOX (SE, TURTLE)))
let _ = output (fun () -> A4'.rotate A4'.box = 
    GLUED (BOX (SW, TURTLE), BOX (SW, WAVE), BOX (SE, TURTLE), BOX (SE, WAVE)))

module B4'= Rotate (B4)
let _ = output (fun () -> B4'.box = 
    GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), BOX (SE, TURTLE), BOX (NE, WAVE)))
let _ = output (fun () -> B4'.rotate B4'.box = 
    GLUED (BOX (SE, WAVE), BOX (SW, WAVE), BOX (SE, TURTLE), BOX (SW, TURTLE)))

module C  = Glue (A4) (B4) (A4') (B4')
let _ = output (fun () -> C.box = 
    GLUED (
      GLUED (BOX (NW, TURTLE), BOX (NW, WAVE), 
             BOX (NE, TURTLE), BOX (NE, WAVE)),
      GLUED (BOX (NW, TURTLE), BOX (NE, TURTLE), 
             BOX (NW, WAVE), BOX (NE, WAVE)),
      GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), 
             BOX (NE, WAVE), BOX (SE, TURTLE)),
      GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), 
             BOX (SE, TURTLE), BOX (NE, WAVE)))
)
let _ = output (fun () -> C.rotate C.box = 
    GLUED
      (GLUED (BOX (SE, WAVE), BOX (SW, WAVE), 
              BOX (SE, TURTLE), BOX (SW, TURTLE)),
       GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), 
              BOX (NE, WAVE), BOX (SE, TURTLE)),
       GLUED (BOX (SE, WAVE), BOX (NE, TURTLE), 
              BOX (SE, TURTLE), BOX (NE, WAVE)),
       GLUED (BOX (SW, TURTLE), BOX (SW, WAVE), 
              BOX (SE, TURTLE), BOX (SE, WAVE)))
)
