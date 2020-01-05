;; SICP Exercise 1.11

; recursive process

(define (recursive n) (
  if (< n 3)
      n
      (+ (recursive (- n 1))
        (* 2 (recursive (- n 2)))
        (* 3 (recursive (- n 3))))
))

; iterative process
; similar to iterative process computing Fibonacci numbers

(define (iterative n)
  (define f0 0)
  (define f1 1)
  (define f2 2)
  (define (next thirdtolast secondtolast last count) (
    if (< count 3)
      last
      (next secondtolast
            last
            (+ last (* 2 secondtolast) (* 3 thirdtolast))
            (- count 1))
  ))
  (cond ((< n 1) f0)
        ((= n 1) f1)
        ((= n 2) f2)
        (else (next f0 f1 f2 n)))
)

;; (iterative 100) evaluates instantly
;; (iterative 100) never does with average 2019 hardware

