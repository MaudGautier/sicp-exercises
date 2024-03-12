(define nil '())
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter
        (cdr things)
        (cons (square (car things)) answer))))
  (iter items nil))

(square-list (list 1 2 3 4))
;Creates the list in reverse order because the square of each element is preprended

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter
        (cdr things)
        (cons answer (square (car things))))))
  (iter items nil))


(square-list-2 (list 1 2 3 4))
;Creates dotted list because append element to list (not a proper list)

(define (square-list-3 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter
        (cdr things)
        (append answer (cons (square (car things)) nil)))))
  (iter items nil))

(square-list-3 (list 1 2 3 4))

;To build a list iteratively, we can:
;- Prepend one element to it with cons:  (cons new-el my-list)
;- Append one element to it with append: (append my-list (cons new-el nil))

