;Helper functions
(define (entry-tree tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (key record) (cadr record))
(define (value record) (caddr record))

;Lookup on a binary tree
(define (lookup x tree)
  (cond
    ((null? tree) #f)
    ((= x (key (entry-tree tree))) (value (entry-tree tree)))
    ((< x (key (entry-tree tree))) (lookup x (left-branch tree)))
    ((> x (key (entry-tree tree))) (lookup x (right-branch tree)))
    )
  )

;Testing
(define tree1 '((list 7 77) ((list 3 33) ((list 1 11) () ()) ((list 5 55) () ())) ((list 9 99) () ((list 11 1111) () ()))))
(lookup 7 '()); Expected: #f
(lookup 7 tree1); Expected: 77
(lookup 5 tree1); Expected: 55
(lookup 3 tree1); Expected: 33
(lookup 1 tree1); Expected: 11
(lookup 4 tree1); Expected: #f
