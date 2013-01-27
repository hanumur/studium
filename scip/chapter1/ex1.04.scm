#!/usr/local/bin/guile -s
!#

;; EXERCISE 1.4 Observe that our model of evaluation allows for combinations whose
;; operators are compound expressions. Use this observation to describe the behavior
;; of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


; if b > 0
; (define (a-plus-abs-b a b)
;     (+ a b))

; if b <= 0
; (define (a-plus-abs-b a b)
;     (- a b))

