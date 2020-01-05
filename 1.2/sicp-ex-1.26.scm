; SICP Exercise 1.26

#|

This version of expmod generates a tree recursion due to 2 seperate recursive calls to itself,
rather than a linear recursion when using square procedure and a single evaluation.

Tree recursion execution time grows exponentially with the depth of the tree, which is log(n) here:

For exp = 8, we have three steps to reach power 1 (4, 2, 1), and 2*2*2 expmod recursive calls.
instead of 3 calls.
For exp = 16, we have 4 steps and 2^4 = 16 calls instead of 4 calls with textbook expmod procedure.

This expmod procedure has time complexity of O(exp(log n)) = O(n) instead of O(log n).

|#

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (* (expmod base (/ exp 2) m)
                        (expmod base (/ exp 2) m))
                     m))
        (else
          (remainder (* base
                        (expmod base (- exp 1) m))
                     m))))