;; SICP Exercise 1.17

; It is assumed that our language can only add, not multiply. It can also double integers or halve them if they are even.

(define (multi a b)
  (define (double n) (+ n n))
  (define (halve even) (/ even 2))
  (cond ((or (= a 0) (= b 0)) 0)
        ((even? b) (double (multi a (halve b)))) ;; recursive process
        (else (+ a (multi a (- b 1)))))
)

(multi 3 9)