(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


;---- (add-1 zero)
;(add-1 (lambda (f) (lambda (x) x)))
;(lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) y)) f) x))))
;(lambda (f) (lambda (x) (f ((f (lambda (y) y)) x))))
;(lambda (f) (lambda (x) (f (f x))))
;=>
(define one (lambda (f) (lambda (x) (f (f x)))))

;---- (add-1 one)
;(add-1 (lambda (f) (lambda (x) (f (f x)))))
;(lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) (g (g y)))) f) x))))
;(lambda (f) (lambda (x) (f (((lambda (y) (f (f y)))) x))))
;(lambda (f) (lambda (x) (f (f (f x)))))
;=>
(define two (lambda (f) (lambda (x) (f (f (f x))))))
