;Mental model:
;(define (gcd lazy_func_returning_A lazy_func_returning_B)
;  (cond ((= lazy_func_returning_B() 0) lazy_func_returning_A())
;    (else (gcd lazy_func_returning_B (remainder lazy_func_returning_A lazy_func_returning_B)))
;    )
;  )

;Emulate normal order by wrapping values in functions => calling the function means evaluating the value
(define (gcd_normal f_a f_b)
  (cond ((= (f_b) 0) (f_a))
        (else (gcd_normal f_b (remainder_normal f_a f_b)))
    )
  )
(define (remainder_normal f_a f_b)
  (lambda () (begin (newline) (display "REMAINDER CALL") (remainder (f_a) (f_b))))
  )

;Testing
(gcd_normal
  (lambda () (begin (newline) (display 206) 206))
  (lambda () (begin (newline) (display 40) 40))
  )

;We have exactly 18 calls to remainder
;Also we see where 206 and 40 get evaluated
;By comparing this with the substitution model, it works
;=> emulating the normal order with lazy functions seems to be a correct mental model