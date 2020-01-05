;; SICP Exercise 1.12

; i and j are zero-based indices locating elements of Pascal’s triangle
;   j 0 1 2
; i
; 0   1
; 1   1 1
; 2   1 2 1
; 3   1 3 3 1

(define (pascal line col) (
  cond ((or (< i 0) (< j 0) (< i j)) 0)
        ((= i j) 1)
        (else (+ (pascal (- i 1) (- j 1))
                 (pascal (- i 1) j)))
))