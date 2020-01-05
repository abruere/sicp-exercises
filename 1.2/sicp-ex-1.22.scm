;; SICP Exercise 1.22

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

;; other dependencies

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0)) ; Use mod instead of remainder for R6RS
(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(search-for-primes 1000 1019) ; 1009, 1013, 1019
(search-for-primes 10000 10037) ; 10007, 10009, 10037
(search-for-primes 100000 100100) ; 100003, 100019, 100043
(search-for-primes 1000000 1000100) ; 1000003, 1000033, 1000037

; Computers are much faster in 2019 than they were at the time of SICP 2d edition.
; Increasing the numbers to test Θ(sqrt(n)) order of growth.
(search-for-primes 100000000 100000100) ; prime numbers around 10e8: ~ 1.0e-2 time
(search-for-primes 1000000000 1000000100) ; around 10e9: ~ 3.0e-2 time ~ sqrt(10) * 1.0e-2
(search-for-primes 10000000000 10000000100) ; around 10e10: ~ 1.0e-1 time ~ sqrt(100) * 1.0e-2

; Program seems to run in time proportional to the number of steps required for the computation.