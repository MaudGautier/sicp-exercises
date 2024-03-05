(load "chapter1/37")

(define (tan-denom i)
  (- (* i 2.0) 1)
  )

(define (tan-num i x)
  (if (= i 1)
    i
    (- 0 (square x))
    ))

(cont-frac (lambda (i) (tan-num i 1)) (lambda (i) (tan-denom i)) 10);1.557407724654902
