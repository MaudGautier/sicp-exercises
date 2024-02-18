(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.00000000000000001)
;For very small numbers => not enough precision => returns value after the first iteration

;(sqrt 10000000000000)
;For very large numbers => too long to get to that level

(define (sqrt-iter-2 guess x previous-guess)
  (if (good-enough-2? guess previous-guess)
      guess
      (sqrt-iter-2 (improve guess x) x guess)))

(define (good-enough-2? guess previous-guess)
  (define change (abs (- guess previous-guess)))
  (< (abs (/ change guess)) 0.000000001))

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x x))

(sqrt-2 9)
(sqrt-2 0.00000000000000001)
(sqrt-2 10000000000000)
