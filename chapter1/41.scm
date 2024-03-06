(define (double proc)
  (lambda (x) (proc (proc x))))

;Testing
(define (inc x) (+ x 1))
((double inc) 5);7
(((double (double double)) inc) 5);8*2+5=21