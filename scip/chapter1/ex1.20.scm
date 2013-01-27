#!/usr/local/bin/guile -s
!#

;; Exercise 1.20. The process that a procedure generates is of course dependent
;; on the rules used by the interpreter. As an example, consider the iterative
;; gcd procedure given above. Suppose we were to interpret this procedure using
;; normal-order evaluation, as discussed in section 1.1.5.
;; Using the substitution method (for normal order), illustrate the process generated
;; in evaluating (gcd 206 40) and indicate the remainder operations that are
;; actually performed. How many remainder operations are actually performed in the
;; normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation? 


; normal order: 18

; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd (gcd (remainder 206 40)) (remainder 40 (remainder 206 40)))
; (gcd (gcd (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; (gcd (gcd (gcd (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))))
; (gcd (gcd (gcd (gcd 2))))
; (gcd (gcd (gcd 2)))
; (gcd (gcd 2))
; (gcd 2)
; 2


; applicative-order: 4

; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; 2

