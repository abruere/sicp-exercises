;; SICP Exercise 1.5

; (define (p) (p))
; (define (test x y)
;   (if (= x 0) 0 y))

; (test 0 (p))

; The evaluation of this expression will never terminate in an interpreter using applicative-order evaluation, because (p) can’t be expanded to a literal value and will keep expanding to itself, by definition.

; Using normal-order evaluation, (p) won’t be evualated due to if special form, and the whole expression evualates to 0.

(test 0 (p)) 
|
v
(if (= 0 0) 0 (p)) 
|
v
(if #t 0 (p))
|
v
0