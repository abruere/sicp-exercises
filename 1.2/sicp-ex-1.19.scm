;; SICP Exercise 1.19

#|
Tpq: (a,b) -> (bq + aq + ap, bp + aq)

Tpq^2: (a, b) = Tpq (bq + aq + ap, bp + aq)
        -> ((bp + aq) * q + (bq + aq + ap) * (q + p), (bp + aq) * p + (bq + aq + ap) * q)
        = (bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2, bp^2 + apq + bq^2 + aq^2 + apq)
        = (b*(2pq + q^2) + a*(2pq + q^2) + a*(p^2+q^2), b*(p^2+q^2) + a*(2pq + q^2))
        = (bq' + aq' + ap', bp' + aq')

where p' = p^2 + q^2 and q' = 2pq + q^2
|#

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
        (fib-iter a
                  b
                  (+ (square p) (square q))
                  (+ (square q) (* 2 p q))
                  (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (square x) (* x x))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)