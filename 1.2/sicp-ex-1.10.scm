;; SICP Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
  ((= x 0) (* 2 y))
  ((= y 1) 2)
  (else (A (- x 1) (A x (- y 1))))))

; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; …
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; …
; (A 0 512)
; 1024 = 2^10

; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2))))
; (A 1 (A 1 4))
; (A 1 2^4)
; (A 1 16)
; 65536 = 2^16 = 2^2^2

; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 4)
; 65536

(define (f n) (A 0 n)) => 2*n
(define (g n) (A 1 n)) => 2^n
(define (h n) (A 2 n)) => 2^2^…^2 (n-1 times)

; By induction, assuming that (A 2 n) = 2^2^…^2 (n-1 times) and (A 1 n) = 2^n
; (A 2 n+1)
; (A 1 (A 2 n))
; (A 1 2^…^2)
; 2^(2^…^2)
; 2^2^…^2 (n times)

; this is called tetration, see https://github.com/sarabander/p2pu-sicp/blob/master/1.2/Ex1.10.pdf
