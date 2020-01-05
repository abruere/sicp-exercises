;; SICP Exercise 1.18

; It is assumed that our language can only add, not multiply. It can also double integers or halve them if they are even.

; This procedure has O(log n) time complexity.
; It has and O(1) space complexity thanks to using an iterative process,
; except for the last step when b is finally halved to 1, and potentially the first step if b original input is odd.
(define (multi a b)
  (define (double n) (+ n n))
  (define (halve even) (/ even 2))
  (cond ((or (= b 0) (= a 0)) 0)
        ((even? b) (multi (double a) (halve b))) ;; iterative process
        (else (+ a (multi a (- b 1)))))
)

(multi 3 9)