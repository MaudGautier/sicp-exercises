(define nil '())

(define (reverse lst)
  (if (null? lst)
    nil
    (append (reverse (cdr lst)) (cons (car lst) nil))
    ))

(define (deep-reverse lst)
  (cond
    ((null? lst) nil)
    ((pair? (car lst)) (append (deep-reverse (cdr lst)) (list (deep-reverse (car lst)))))
    (else (append (deep-reverse (cdr lst)) (list (car lst))))
    )
  )

(define x (list (list 1 2) (list 3 4)))
(reverse (list 1 2));(2 1)
(reverse x) ;((3 4) (1 2))
(deep-reverse x) ;((4 3) (2 1))
