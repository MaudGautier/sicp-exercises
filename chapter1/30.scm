(define (sum-rec term a next b)
	(if (> a b)
			0
			(+ (term a)
			(sum-rec term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (+ a 1) (+ result (term a))))
    )
  (iter a 0)
  )

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes-rec a b)
  (sum-rec cube a inc b))
(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))

(sum-cubes-rec 1 3);36
(sum-cubes-iter 1 3);36
(sum-cubes-rec 4 6);405
(sum-cubes-iter 4 6);405

(define (identity x) x)
(define (sum-identity-rec a b)
  (sum-rec identity a inc b))
(define (sum-identity-iter a b)
  (sum-iter identity a inc b))

(sum-identity-rec 1 3);6
(sum-identity-iter 1 3);6
(sum-identity-rec 4 6);15
(sum-identity-iter 4 6);15
