;Original
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2 .0)) add-dx b)
    dx))
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
      (sum term (next a) next b))))

;Simpson rule
(define (simpson-rule proc a b n)
  (define h (/ (- b a) n))
  (define (iter i result)
    (define new-value (proc (+ a (* h i))))
    (if (> i n)
      result
      (cond
        ((= i 0) (iter (+ 1 i) (+ result new-value)))
        ((= i n) (iter (+ 1 i) (+ result new-value)))
        ((even? i) (iter (+ 1 i) (+ result (* 2 new-value))))
        (else (iter (+ 1 i) (+ result (* 4 new-value))))
        )
      ;      (iter (+ 1 i) (+ result (proc (+ a (* h i)))))
      )
    )
  (* (iter 0 0) (/ h 3))
  )


(integral cube 0 1 0 .01) ;.24998750000000042
(integral cube 0 1 0 .001) ;.249999875000001

(simpson-rule cube 0 1 100);1/4
(simpson-rule cube 0 1 1000);1/4

