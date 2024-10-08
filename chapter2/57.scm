;Helper procedures
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num) (and (number? exp) (= exp num)))

;(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2) ((=number? a2 0) a1)
    ((and (number? a1) (number? a2)) (+ a1 a2))
    (else (list '+ a1 a2))))

;(define (make-product m1 m2) (list '* m1 m2))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
    ((=number? m1 1) m2)
    ((=number? m2 1) m1)
    ((and (number? m1) (number? m2)) (* m1 m2))
    (else (list '* m1 m2))))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))


(define (accumulate proc initial sequence)
  (if (null? sequence)
    initial
    (proc (car sequence)
      (accumulate proc initial (cdr sequence)))))

(define (addend s) (cadr s))

;(define (augend s) (caddr s))
(define (augend s) (accumulate make-sum 0 (cddr s)))

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

;(define (multiplicand p) (caddr p))
(define (multiplicand p) (accumulate make-product 1 (cddr p)))

;Exponentiation
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (make-subtraction a1 a2)
  (cond
    ((=number? a1 0) (- 0 a2)) ((=number? a2 0) a1)
    ((and (number? a1) (number? a2)) (- a1 a2))
    (else (list '- a1 a2))))

;(define (make-exponentiation a1 a2)
;  (list '** a1 a2)
;  )
(define (make-exponentiation a1 a2)
  (cond ((=number? a2 0) 1)
    ((=number? a2 1) a1)
    ((and (number? a1) (number? a2))
      (expt a1 a2))
    (else (list '** a1 a2)))
  )



;Derivation procedure
(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp) (if (same-variable? exp var) 1 0))
    ((sum? exp) (make-sum
                  (deriv (addend exp) var)
                  (deriv (augend exp) var)))
    ((product? exp)
      (make-sum
        (make-product (multiplier exp)
          (deriv (multiplicand exp) var))
        (make-product (deriv (multiplier exp) var)
          (multiplicand exp))))
    ((exponentiation? exp)
      (make-product
        (make-product
          (exponent exp)
          (make-exponentiation (base exp) (make-subtraction (exponent exp) 1))
          )
        (deriv (base exp) var)
        )
      )
    (else
      (error "unknown expression type: DERIV" exp))))

;Testing
(deriv '(+ x 3) 'x) ; Expected: 1
(deriv '(+ x 3 y) 'x) ; Expected: 1
(deriv '(+ x 3 x) 'x) ; Expected: 2
(deriv '(* x y) 'x) ; Expected: y
(deriv '(* x y y) 'x) ; Expected: (* y y)
(deriv '(* x y (+ x 3)) 'x) ; Expected: (+ (* x y) (* y (+ x 3)))

