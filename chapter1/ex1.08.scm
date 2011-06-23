#!/usr/local/bin/guile -s
!#

;; Exercise 1.8. Newton's method for cube roots is based on the fact that
;; if y is an approximation to the cube root of x, then a better approximation is given by the value
;;
;;   x/y^2 + 2y
;; --------------
;;       3
;;
;; Use this formula to implement a cube-root procedure analogous to the square-root procedure.


(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) 0.001))

(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (cube-root x)
  (sqrt-iter 1.0 0.0 x))

