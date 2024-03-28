(define (iterative-improve good-enough? improve)
  (define (proc x)
    (if (good-enough? x)
      x
      (proc (improve x))
      )
    )
  (lambda (y) (proc 1.0))
  )
(define (avg x y)
  (/ (+ x y) 2)
  )
(define (sqrt x)
  (define tolerance 0.0001)
  (define (good-enough? guess)
    (if (< (abs (- (* guess guess) x)) tolerance)
      #t
      #f
      )
    )
  (define (improve guess)
    (avg guess (/ x guess))
    )
  ((iterative-improve good-enough? improve) x)
  )

(sqrt 16);4.000000636692939
