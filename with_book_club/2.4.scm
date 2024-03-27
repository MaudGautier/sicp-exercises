;------ 2.04
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

;(car (cons x y)) ; --> x
;((lambda (m) (m x y)) (lambda (p q) p))
;(lambda (p q) p) x y)
;x


;------ 2.05
;2^a*3^b
;a = 2 ; b = 2
;36

;2^a*3^b = 2^c*3^d ==> a = c and b = d
;2^(a-c)*3^(b-d) = 1
;a = c and b = d


