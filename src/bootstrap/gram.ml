type expr
  = Lam of string * expr
  | Var of string
  | App of expr * expr
  | Opp of expr * string * expr
  | Chr of char
[@@deriving show]

let rec mklam e =
  function [] -> e
	 | hd :: tl -> Lam(hd, mklam e tl)
