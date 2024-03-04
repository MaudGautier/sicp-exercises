(define (filtered-accumulate filter-predicate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner
      (if (filter-predicate a) (term a) null-value)
      (filtered-accumulate filter-predicate combiner null-value term (next a) next b))
    )
  )
;
;
;  (if (> a b)
;    (display "Finished")
;    (if (filter-predicate a)
;      (accumulate combiner null-value term a next b)
;      (filtered-accumulate filter-predicate combiner null-value term (next a) next b)
;      )
;    )
;  )

;(load "chapter1/22.scm");To get the prime? predicate
(define (inc n) (+ 1 n))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))
    )
  )
(define (divides? a b)
  (= (remainder b a) 0))


(define (sum-square-prime a b)
  (filtered-accumulate prime? (lambda (x y) (+ x y)) 0 square a inc b)
  )



(sum-square-prime 0 1) ;1
(sum-square-prime 0 2);5
(sum-square-prime 0 3);14
(sum-square-prime 0 4);14
