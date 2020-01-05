;; SICP Exercise 1.16

(define (iterative-expt b exponent)
  ; transform product in such a way that (product * b^n) = b^exponent
  (define (next product b n)
    (cond ((= n 0) product)
          ((even? n) (next product (square b) (/ n 2)))
          (else (next (* b product) b (- n 1)))))
  (next 1 b exponent))

(define (square n) (* n n))

(iterative-expt 10 0)
(iterative-expt 2 10)