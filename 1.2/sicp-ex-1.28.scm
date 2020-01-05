;; SICP Exercise 1.28

(define (prime-test-miller-robin n)
  (newline)
  (display n)
  (define (next a)
    (cond ((>= a n) (display " is prime."))
          ((= (expmod a n n) a) (next (+ a 1)))
          (else (display " is most probably not prime."))
    ))
  (next 1))

;; Using the Miller-Rabin test

(define (expmod base exp m)
  (define (check-sqrt-1-mod-m r)
     (define (check r sq-mod)
       (if (and (= sq-mod 1)
                (not (= r 1))
                (not (= r (- m 1))))
           0
           sq-mod))
     (check r (remainder (square r) m)))
  (cond ((= exp 0) 1)
        ((even? exp) (check-sqrt-1-mod-m (expmod base (/ exp 2) m)))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square x) (* x x))

(define (prime? n)
  (fast-prime? n 100))

; Following Carmichael numbers are not prime and rejected by the Miller-Rabin test as expected
(prime-test-miller-robin 561)
(prime-test-miller-robin 1105)
(prime-test-miller-robin 1729)
(prime-test-miller-robin 2465)
(prime-test-miller-robin 2821)
(prime-test-miller-robin 6601)