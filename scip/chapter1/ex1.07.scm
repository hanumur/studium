#!/usr/local/bin/guile -s
!#

;; Exercise 1.7. The good-enough? test used in computing square roots will not be very effective
;; for finding the square roots of very small numbers. Also, in real computers, arithmetic operations
;; are almost always performed with limited precision. This makes our test inadequate for very large numbers.
;; Explain these statements, with examples showing how the test fails for small and large numbers.
;; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration
;; to the next and to stop when the change is a very small fraction of the guess.
;; Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers? 


(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) 0.001))

(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (better-sqrt x)
  (sqrt-iter 1.0 0.0 x))

; sqrt 0.0625          = 0.25
; (sqrt 0.0625)        = 0.250141095299908
; (better-sqrt 0.0625) = 0.250000039793309

; sqrt 12596346303791122097392430351652201          = 112233445566778899
; (sqrt 12596346303791122097392430351652201)        = 112233445566779000.0
; (better-sqrt 12596346303791122097392430351652201) = 112233445566779000.0

; Work better for small numbers

