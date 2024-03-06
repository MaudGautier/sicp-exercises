(define (compose proc-1 proc-2)
  (lambda (x) (proc-1 (proc-2 x))))

;Testing
(define (inc x) (+ 1 x))
((compose square inc) 6);49