(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))
    )
  )

(define (sum term a next b)
  (accumulate (lambda (x y) (+ x y)) 0 term a next b)
  )
(define (product term a next b)
  (accumulate (lambda (x y) (* x y)) 1 term a next b)
  )

;Testing
(define (inc n) (+ n 1))
(sum square 0 inc 1);1
(sum square 0 inc 2);5
(sum square 0 inc 3);14
(product square 1 inc 1);1
(product square 1 inc 2);4
(product square 1 inc 3);36

