;; SICP Exercise 1.7

; With initial version (sqrt 9) yields 3.00009155413138
; (sqrt 0.0001) yields 0.03230844833048122 instead of the expected 0.01 (an error of over 200%). Absolute precision 0.001 being smaller than real square root, recursion stops prematurely.
; (sqrt 10000000000000) never ends

;; 1st improved version below, using previous guess
;; (sqrt 0.0001) yields 0.01 as expected
;; (sqrt 10000000000000) yields 3162277.6601683795
;; And “medium” size values yield better results too:
;; (sqrt 9) yields 3.000000001396984

(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess x)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess previous x)
  (< (abs (- guess previous)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(sqrt 9)

;; 2d attempt, improving results near lower and upper binary 64 bounds (10e−324 and 10e308)


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; only change from original version
;; recursion stops when bit precision is limiting
(define (good-enough? guess x)
  (= guess (improve guess x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; (sqrt 25.0e-320)
;; (sqrt 81.0e-64)

;; inifinite loop, as seen in https://github.com/sarabander/p2pu-sicp/blob/master/1.1/Ex1.7.scm
;; (sqrt 1.7e+310)