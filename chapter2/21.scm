(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (cdr items))))

(define (square-list-2 items)
  (map (lambda (x) (* x x)) items))

(square-list-1 (list 1 2 3 4));(1 4 9 16)
(square-list-2 (list 1 2 3 4));(1 4 9 16)