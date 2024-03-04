;Recursive accumulate
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

;Testing recursive
(define (inc n) (+ n 1))
(sum square 0 inc 1);1
(sum square 0 inc 2);5
(sum square 0 inc 3);14
(product square 1 inc 1);1
(product square 1 inc 2);4
(product square 1 inc 3);36


;Iterative accumulate
(define (accumulate-2 combiner null-value term a next b)
  (define (iter i result)
    (if (> i b)
      result
      (iter (next i) (combiner result (term i)))
      ))
  (iter a null-value)
  )

(define (sum-2 term a next b)
  (accumulate-2 (lambda (x y) (+ x y)) 0 term a next b)
  )
(define (product-2 term a next b)
  (accumulate-2 (lambda (x y) (* x y)) 1 term a next b)
  )

;Testing iterative
(sum-2 square 0 inc 1);1
(sum-2 square 0 inc 2);5
(sum-2 square 0 inc 3);14
(product-2 square 1 inc 1);1
(product-2 square 1 inc 2);4
(product-2 square 1 inc 3);36


