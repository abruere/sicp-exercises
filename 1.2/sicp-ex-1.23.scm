; SICP Exercise 1.23

; Same procedures as in 1.22 except for find-divisor edited as required with next procedure.

;See comments at the end.

(define (search-for-primes l h)
  (cond ((even? l) (search-for-primes (+ l 1) h))
        (else (timed-prime-test l)))
  (if (and (< l (- h 1)) (odd? l)) (search-for-primes (+ l 2) h)))

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

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2) 3 (+ n 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0)) ; Use mod instead of remainder for R6RS
(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

; Computers are much faster in 2019 than they were at the time of SICP 2d edition.
; Increasing to be able to measure time.
(search-for-primes 100000000 100000100) ; prime numbers around 10e8: ~ 1.0e-2 time, same time
(search-for-primes 1000000000 1000000100) ; around 10e9: ~ 2.0e-2 time vs 3.0e-2 in 1.22, ~50% faster
(search-for-primes 10000000000 10000000100) ; around 10e10: ~ 6.0e-2 or 7.0e-2 time vs 1.0e-1 ~45-65% faster

; not 100% faster (2x time reduction) as expected, probably due to additional if check in next procedure.