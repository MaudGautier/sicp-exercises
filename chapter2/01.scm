;Original
;(define (make-rat n d) (cons n d))

(define (make-rat n d)
  (cond ((and (negative? d) (negative? n)) (cons (negative n) (negative d)))
        ((negative? d) (cons (negative n) (negative d)))
        (else (cons n d)))
  )

(define (negative? number)
  (< number 0))

(define (negative number)
  (- number))


(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 1 2));1/2
(print-rat (make-rat -1 2));-1/2
(print-rat (make-rat -1 -2));1/2
(print-rat (make-rat 1 -2));-1/2