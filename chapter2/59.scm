(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set))))
  )

(define (union-set set1 set2)
  (cond
    ((null? set2) set1)
    ((element-of-set? (car set2) set1) (union-set set1 (cdr set2)))
    (else (union-set (append set1 (list (car set2))) (cdr set2)))
    ))

;Testing
(define set1 (list 1 2 3))
(define set2 (list 2 3 4))
(union-set set1 set2); Expected: (1 2 3 4)
(define set1 (list '+ 'a 3))
(define set2 (list 'b 3 4))
(union-set set1 set2); Expected: ('+ a 3 b 4)