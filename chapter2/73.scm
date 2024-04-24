(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp) (if (same-variable? exp var) 1 0))
    (else ((get 'deriv (operator exp))
            (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;Part a.
;get returns the appropriate function based on the operator given
;number? and same-variable?: nothing to dispatch on => not in the dispatch table (simple predicates)

;Part b. and c. (A lot from exercise 56)
(define (install-deriv-package)
  ;;internal procedures
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (base e) (car e))
  (define (exponent e) (cadr e))

  (define (make-sum a1 a2) (list '+ a1 a2))
  (define (make-product m1 m2) (list '* m1 m2))
  (define (make-exponentiation a1 a2)
    (list '** a1 a2)
    )

  (define (deriv-sum exp var)
    (make-sum
      (deriv (addend exp) var)
      (deriv (augend exp) var))
    )
  (define (deriv-product exp var)
    (make-sum
      (make-product (multiplier exp)
        (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
        (multiplicand exp)))
    )
  (define (deriv-exponentiation exp var)
    (make-product
      (make-product
        (exponent exp)
        (make-exponentiation (base exp) (make-subtraction (exponent exp) 1))
        )
      (deriv (base exp) var)
      ))

  ;;interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  (put 'deriv '** deriv-exponentiation)
  )

;Part d.
;If we used `((get (operator exp) 'deriv) (operands exp) var)` instead (switching tag and operator),
;we would need to change in `put`: `(put '+ 'deriv deriv-sum)`
