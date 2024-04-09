
(define (equal? item1 item2)
;  (newline) (display item1) (display "::") (display item2)
  (cond
    ((and (symbol? item1) (symbol? item2) (eq? item1 item2)) #t)
    ((and (null? item1) (null? item2) (eq? item1 item2)) #t) ; Needs this for the empty list
    ((and
       (pair? item1)
       (pair? item2)
       (equal? (car item1) (car item2))
       (equal? (cdr item1) (cdr item2))
       ) #t)
    (else #f)
    )
  )




;Testing
(equal? '(this is a list) '(this is a list)); Expected: #t
(equal? '(this is a list) '(this (is a) list)); Expected: #f