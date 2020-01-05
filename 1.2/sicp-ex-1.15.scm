;; SICP Exercise 1.15

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a. To compute sine(12.15),
; procedure p is applied 5 times, solving 12.15/3^n <= 0.1
; log(121.5) <= n*log(3) <=> n >= log(121.5)/log(3) <=> n >= 5
; Consecutively:
; sine(4.05)
; sine(1.35)
; sine(0.45)
; sine(0.15)
; sine(0.05)

; b. Procedure could be optimized for big numbers sin(x) = sin(x + k*2*pi).

; Without optimization, space and time complexity depends on the size of x.
; One step is added for each multiplication of x by 3, so that time complexity is O(log n). The process is recursive and so much space is needed to keep track of calls. Space complexity is O(log n) as well.