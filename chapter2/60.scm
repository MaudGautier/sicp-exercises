(define (adjoin-multiset set element)
  (cons element set))
;time complexity: o(1)

(define (union-multiset set1 set2)
  (append set1 set2)
  )
;time complexity: o(1)


;Testing adjoin-multiset
(define set1 (list 1 2 3))
(adjoin-multiset set1 4); Expected: (4 1 2 3)
(adjoin-multiset set1 2); Expected: (2 1 2 3)
(define set2 (list '+ 'a 3))
(adjoin-multiset set1 2); Expected: (2 '+ a 3 b)

;Testing union-multiset
(define set1 (list 1 2 3))
(define set2 (list 2 3 4))
(union-multiset set1 set2); Expected: (1 2 3 2 3 4)
(define set1 (list '+ 'a 3))
(define set2 (list 'b 3 4))
(union-multiset set1 set2); Expected: ('+ a 3 b 3 4)