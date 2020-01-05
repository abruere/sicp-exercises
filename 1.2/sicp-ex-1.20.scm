;; SICP Exercise 1.20

; Euclide’s Algorithm as an iterative process
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

#|
Normal-order evaluation
(gcd 206 40)
(if (= 40 0) ; evaluated predicate
    206
    (gcd 206 (remainder 206 40))) ; alternative evualuated: 0 call to remainder (gcd is expanded first)

(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) 206 alternative) ; 1 call in predicate, no call in if-alternative before fully expanding gcd below
(if (= 6 0) 206 alternative)

alternative: (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0) …) ; 2 calls
(if (= 4 0) …)

(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) …) ; 4 calls
(if (= 2 0) …)

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
        0)
    …) ; 7 calls
(if (= 0 0) …) ; predicate is true so that consequent is evualated

consequent:
(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 4 calls
2

18 calls to reminder in total.

…
can’t complete.

; Applicative-order evaluation (scheme interpreter)
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2

4 calls to reminder with applicative-order evaluation using the same iterative process.
|#