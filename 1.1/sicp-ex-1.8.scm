;; SICP Exercise 1.8

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
      3))

;; only change from original version
;; recursion stops when bit precision is limiting
(define (good-enough? guess x)
  (= guess (improve guess x)))

(define (cuberoot x)
  ((if (< x 0) - +)
    (cube-root-iter (improve 1.0 (abs x)) 1 (abs x))))
;; prevents edge-cases involving division by 0 such as(cuberoot -2)

(cuberoot -27) ;; -3
(cuberoot -0.000001) ;; -0.01
(cuberoot 27e-300) ;; 3e-100
(cuberoot 64e306) ;; 4e102