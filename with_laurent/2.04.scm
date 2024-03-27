(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))


(define x (list 1 2 3 4))
(define y 7)
(car (cons x y));(list 1 2 3 4)
(cdr (cons x y));7


;Mathematical proof
;(car (cons x y))
;((cons x y) (lambda (p q) p))
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (p q) p) x y)
;x

(car (cons x y)) == x
