;; SICP Exercise 1.6

;; Due to applicative-order evualation of new-if, the square root procedure call can’t terminate as the procedure keeps calling itself even once the approximation is good enough.

;; if built-in special form only evualates the consequent or the alternative depending on the predicate, not both, so that recursion can end.