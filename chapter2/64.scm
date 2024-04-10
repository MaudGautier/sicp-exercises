(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let (
             (left-result (partial-tree elts left-size)))
        (let (
               (left-tree (car left-result))
               (non-left-elts (cdr left-result))
               (right-size (- n (+ left-size 1))))
          (let (
                 (this-entry (car non-left-elts))
                 (right-result (partial-tree (cdr non-left-elts) right-size)))
            (let (
                   (right-tree (car right-result))
                   (remaining-elts (cdr right-result)))
              (cons (make-tree this-entry
                      left-tree
                      right-tree)
                remaining-elts)))))))
  )

;partial-tree:
; - takes the first half of the elements and creates a tree from it (left-tree)
; - takes the second half of the elements and creates a tree from it (right-tree)
; - operates recursively on the two subtrees
; In the end, it creates a balanced tree from the input list

;Tree produced:
;         5
;        / \
;       /   \
;      1     9
;       \   / \
;        3 7   11

;time-complexity: o(n) (all elements traversed)

