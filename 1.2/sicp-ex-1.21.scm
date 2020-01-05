;; SICP Exercise 1.21

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (mod b a) 0)) ; Using mod instead of remainder for R6RS
(define (square x) (* x x))


(smallest-divisor 999) ; 3
(smallest-divisor 1999) ; 1999 (prime)
(smallest-divisor 19999) ; 7