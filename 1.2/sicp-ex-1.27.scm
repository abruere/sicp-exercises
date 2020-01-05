; SICP Exercise 1.27

(define (carmichael-test n)
  (newline)
  (display n)
  (define (next a)
    (cond ((>= a n) (display " fools the Fermat test if it’s not prime (Carmichael number)."))
          ((= (expmod a n n) a) (next (+ a 1)))
          (else (display " fails the Fermat test."))
    ))
  (next 1))


;; Using the Fermat test

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square x) (* x x))

(define (prime? n)
  (fast-prime? n 100))

(carmichael-test 7) ; prime, must pass the Fermat test
(carmichael-test 8) ; not prime, must fail the test

; Following Carmichael numbers are not prime, but should pass and fool the Fermat test
(carmichael-test 561) ; 3 * 187 
(carmichael-test 1105) ; 5 * 221
(carmichael-test 1729) ; 7 * 247
(carmichael-test 2465) ; 5 * 493
(carmichael-test 2821) ; 7 * 403
(carmichael-test 6601) ; 7 * 943