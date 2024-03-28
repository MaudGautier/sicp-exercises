; Binary
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))


; Standard tree
(define (left-branch tree) (car tree))
(define (right-branches tree) (cdr tree))
(define (make-tree left rest)
  (cons left rest))


(define tree (make-tree (list 1 2) (list 3 4 5)))

(left-branch tree)
(right-branches tree)

;Some attempt at displaying the tree. Works but no real plotting done.
(define (display-tree tree depth)
  (if (not (pair? tree))
    (begin (newline)
           (display "depth is ")
           (display depth)
           (display ": value is ")
           (display tree))
    (begin (newline)
           (display "DEPTH")
           (display depth)
           (display tree)
           (display-tree (left-branch tree) (+ depth 1))
           (map (lambda (t) (display-tree t (+ depth 1))) (right-branches tree))
      )
    )
  )

(display-tree tree 0)


; +--------+----+----+
; |        |    |    |
; +---+    |    |    |
; |   |    3    4    5
; 1   2