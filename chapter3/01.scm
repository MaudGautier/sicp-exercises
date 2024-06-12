(define (make-accumulator initial)
  (lambda (value)
    (begin (set! initial (+ initial value))
           initial
      )
    )
  )

;Testing
(define A (make-accumulator 5))
(A 10) ;Expected: 15
(A 10) ;Expected: 25
