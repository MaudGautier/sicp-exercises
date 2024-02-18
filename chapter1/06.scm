(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;;Original definition
;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
;ERROR: Get a maximum recursion depth exceeded

;Because `new-if` is a procedure => it uses applicative order => all its arguments are evaluated before it is called
;VS: regular `if` (special form) is evaluated on the go:
;> To evaluate an if expression, the interpreter starts by evaluating the <predicate> part of the expression.
;> If the <predicate> evaluates to a true value, the interpreter then evaluates the <consequent> and returns its value.
;> Otherwise it evaluates the <alternative> and returns its value.

;Reference: https://stackoverflow.com/questions/1171252/whats-the-explanation-for-exercise-1-6-in-sicp