(define (union-set set1 set2)
  (cond
    ((null? set1) set2)
    ((null? set2) set1)
    ((< (car set1) (car set2)) (cons (car set1) (union-set (cdr set1) set2)))
    ((> (car set1) (car set2)) (cons (car set2) (union-set set1 (cdr set2))))
    ((= (car set1) (car set2)) (cons (car set1) (union-set (cdr set1) (cdr set2))))
    )
  )
;Time complexity: o(n)

;Testing
(define set1 (list 1 4 9))
(define set2 (list 0 2 7 12))
(union-set set1 set2); Expected: (0 1 2 4 7 9 12)
(union-set set2 set1); Expected: (0 1 2 4 7 9 12)