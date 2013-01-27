#!/usr/local/bin/guile -s
!#

;; EXERCISE 1.5 Ben Bitdiddle has invented a test to determine whether the interpreter
;; he is faced with is using applicative-order evaluation or normal-order evaluation. 
;; He defines the following two procedures: 

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))


; Applicative order evaluates all arguments to a function before applying it.
; Normal order evaluates the arguments only when needed.

; Guile is the interpreter that I use, it uses applicative-order evaluation.
; It will try to evaluate recursively (p), so it will never complete evaluation.

