(load "chapter2/62")
(load "chapter2/63")
(load "chapter2/64")

(define (union-tree tree1 tree2)
  (let (
         (set1 (tree->list-1 tree1))
         (set2 (tree->list-1 tree2))
         )
    (let ((union-result (union-set set1 set2)))
      (list->tree union-result))
    )
  )


;Testing
(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define tree2 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))
(define tree3 '(4 (3 (0 () ()) ()) (15 (6 () ()) (20 () ()))))
(union-tree tree1 tree2) ; Expected: (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
(union-tree tree1 tree3) ; Expected: (6 (3 (0 () (1 () ())) (4 () (5 () ()))) (11 (7 () (9 () ())) (15 () (20 () ()))))

