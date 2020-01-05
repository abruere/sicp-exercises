;; SICP Exercise 1.25

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


#|
This version of expmod procedure would be slower since it would compute square of potentially much larger numbers when n is large (and b > 1), while the textbook version below ensures we never compute squares larger than m^2 thanks to modulo, using following property:
if a mod m = x
and b mod m = y
then ab mod m = xy mod m
|#


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                          m))))
