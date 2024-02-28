;For sequences:
;(define (square-list-1 items)
;  (if (null? items)
;      nil
;      (cons (* (car items) (car items)) (cdr items))))
;
;(define (square-list-2 items)
;  (map (lambda (x) (* x x)) items))

;For trees:
(define nil '())

(define (square-tree-1 tree)
  (display tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))
    )
  )


(define tree1 (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))
(square-tree-1 tree1) ;(1 (4 (9 16) 25) (36 49))
;(square-tree-2 lst1);(1 (4 (9 16) 25) (36 49))