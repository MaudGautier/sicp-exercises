(define (cube-root x)
  (cube-root-iter 1.0 x 0.0))

(define (cube-root-iter guess x previous-guess)
  (if (good-enough? guess previous-guess)
      guess
      (cube-root-iter (improve guess x) x guess)
    )
  )

(define (good-enough? guess previous-guess)
  (define change (- guess previous-guess))
  (< (abs (/ change guess)) 0.000000000001)
  )

(define (improve guess x)
;  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (define denom 3)
  (define num-1 (/ x (* guess guess)))
  (define num-2 (* 2 guess))
  (define num (+ num-1 num-2))
  (/ num denom)
  )



(cube-root 1)
(cube-root 8)
(cube-root 27)