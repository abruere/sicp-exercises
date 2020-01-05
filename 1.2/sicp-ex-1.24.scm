;; SICP Exercise 1.24

; Now using the Fermat test for prime numbers, based on Fermat’s Little Theorem:
; If n is a prime number and a is any positive integer less than n, then a raised to the n-th power is congruent to a modulo n.

(define (search-for-primes l h)
  (cond ((even? l) (search-for-primes (+ l 1) h))
        (else (timed-prime-test l)))
  (if (and (< l (- h 1)) (odd? l)) (search-for-primes (+ l 2) h)))

;; provided code

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

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

(search-for-primes 1000 1019) ; 1009, 1013, 1019
(search-for-primes 10000 10037) ; 10007, 10009, 10037
(search-for-primes 100000 100100) ; 100003, 100019, 100043
(search-for-primes 1000000 1000100) ; 1000003, 1000033, 1000037

; Computers are much faster in 2019 than they were at the time of SICP 2d edition.
; Increasing the numbers to be able to measure time.
(search-for-primes 100000000 100000100) ; prime numbers around 10e8: too fast
(search-for-primes 1000000000 1000000100) ; around 10e9: too fast
(search-for-primes 1000000000000 1000000000100) ; around 10e12: too fast
(search-for-primes 1000000000000000 1000000000000100) ; around 10e15: 1.0e-2
(search-for-primes (square 1000000000000000) (+ (square 1000000000000000) 1000)) ; around 10e30: 2.0e-2 or 3.0e-2
(search-for-primes (square (square 1000000000000000)) (+ (square(square 1000000000000000)) 1000)) ; around 10e60: 5.0e-2 or 6.0e-2

; This bears out log(n) growth. Running time is expected to be linear in the number of digits:
; log(n*n) = 2log(n)
; log(n⁴) = 4log(n)
; It seems quite true, with a slight overhead (x2.5 ratio instead of 2x) that could be due to operations on big integers (> max 64-bit integer).