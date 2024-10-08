;Helper procedures
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2) ((=number? a2 0) a1)
    ((and (number? a1) (number? a2)) (+ a1 a2))
    (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
    ((=number? m1 1) m2)
    ((=number? m2 1) m1)
    ((and (number? m1) (number? m2)) (* m1 m2))
    (else (list m1 '* m2))))

(define (cleaner sequence)
  (if (null? (cdr sequence))
    (car sequence)
    sequence))


(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

;(define (augend s) (caddr s))
(define (augend s) (cleaner (cddr s)))

(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

;(define (multiplicand p) (caddr p))
(define (multiplicand p) (cleaner (cddr p)))

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
    (else
      (error "unknown expression type: DERIV" exp))))


;Testing
(deriv '(x + 3) 'x) ; Expected: 1
(deriv '(x * y) 'x) ; Expected: y
(deriv '((x * y) * (x + 3)) 'x) ; Expected: ((x * y) + (y * (x + 3)))
(deriv '(x + (3 * (x + (y + 2)))) 'x) ; Expected: 4
(deriv '(x + 3 * (x + y + 2)) 'x) ; Expected: 4
