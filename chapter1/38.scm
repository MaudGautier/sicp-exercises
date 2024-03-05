(load "chapter1/37")

(define (euler-denom i)
  (cond
    ((= i 1) 1)
    ((= i 2) 2)
    ((= (modulo i 3) 2) (* 2 (/ (+ 1 i) 3)))
    (else 1)
    )
  )

(cont-frac (lambda (i) 1.0) (lambda (i) (euler-denom i)) 10000) ;.7182818284590453
