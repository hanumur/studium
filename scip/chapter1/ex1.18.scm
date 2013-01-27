#!/usr/local/bin/guile -s
!#

;; Exercise 1.18. Using the results of exercises 1.16 and 1.17, devise a procedure
;; that generates an iterative process for multiplying two integers in terms of
;; adding, doubling, and halving and uses a logarithmic number of steps.


(define (double a)
    (* a 2))

(define (halve a)
    (/ a 2))

(define (fast-mult-iter a b n)
    (cond ((= b 0) n)
          ((even? b) (fast-mult-iter (double a) (halve b) n))
          (else (fast-mult-iter a (- b 1) (+ a n)))))

(define (fast-mult a b)
    (fast-mult-iter a b 0))

