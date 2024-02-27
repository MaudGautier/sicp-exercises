(define (last-pair lst)
  (if (null? (cdr lst))
        (car lst)
        (last-pair (cdr lst))
        )
  )

(define test-list (list 23 72 149 34))
(last-pair test-list);34