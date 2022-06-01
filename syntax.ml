(** Arithmetical expressions. *)
type expression =
  | Numeral of int (** non-negative integer constant *)
  | Plus of expression * expression  (** Addition [e1 + e2] *)
  | Minus of expression * expression (** Difference [e1 - e2] *)
  | Times of expression * expression (** Product [e1 * e2] *)
  | Divide of expression * expression (** Quotient [e1 / e2] *)
  | Negate of expression (** Opposite value [-e] *)
