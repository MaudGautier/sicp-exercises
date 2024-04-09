(define (adjoin-set x set)
  (define (iter left right)
;    (newline) (display "x=") (display x)
;    (newline) (display "left=") (display left)
;    (newline) (display "right=") (display right)
    (cond
      ((null? right) (append left (list x)))
      ((= x (car right)) (append left right))
      ((< x (car right)) (append left (list x) right))
      ((> x (car right)) (iter (append left (list (car right))) (cdr right)))
      )
    )
  (iter '() set)
  )


;Testing
(define set1 (list 1 5 9))
(adjoin-set 0 set1); Expected: (0 1 5 9)
(adjoin-set 3 set1); Expected: (1 3 5 9)
(adjoin-set 5 set1); Expected: (1 5 9)
(adjoin-set 12 set1); Expected: (1 5 9 12)
