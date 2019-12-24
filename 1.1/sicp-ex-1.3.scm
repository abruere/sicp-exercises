;; SICP exercise 1.3

(define (sum-larger-squares x y z)
  (cond ((and (>= x z) (>= y z)) (+ (square x) (square y)))
        ((and (>= x y) (>= z y)) (+ (square x) (square z)))
        (else (+ (square y) (square z)))))

(define (square x) (* x x))

(sum-larger-squares 1 1 1)
;; 2
(sum-larger-squares 1 3 2)
;; 13
(sum-larger-squares 2 3 2)
;; 13