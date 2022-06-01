Open Syntax

let rec eval = function
  | Syntax.Numeral n -> n
  | Syntax.Plus (e1, e2) -> eval e1 + eval e2
  | Syntax.Minus (e1, e2) -> eval e1 - eval e2
  | Syntax.Times (e1, e2) -> eval e1 * eval e2
  | Syntax.Divide (e1, e2) ->
      let n2 = eval e2 in
	if n2 <> 0 then eval e1 / n2 else 0
  | Syntax.Negate e -> - (eval e)
