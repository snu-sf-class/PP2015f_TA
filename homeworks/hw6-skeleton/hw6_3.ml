exception TODO

type team = Korea | France | Usa | Brazil | Japan | Nigeria | Cameroon
          | Poland | Portugal | Italy | Germany | Norway | Sweden | England
          | Argentina

type tourna = LEAF of team
            | NODE of tourna * tourna

let rec drop (t: tourna) (d: team): string =
  raise TODO

