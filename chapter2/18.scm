;(define (reverse lst)
;  (if (null? (cdr lst))
;      lst
;      (cons (reverse (cdr lst)) (car lst))
;    ))

(define nil '())

(define (reverse lst)
  (if (null? (cdr lst))
      lst
      (append (reverse (cdr lst)) (cons (car lst) nil))
    ))

(reverse (list 1 4 9 16 25));(25 16 9 4 1)

;Difference between cons and append --> https://stackoverflow.com/questions/36498570/can-someone-explain-the-difference-between-cons-and-append-in-scheme
;- proper list -> the cdr of the last element must be the empty list
;- dotted list -> a pair that does not have a proper list as its last cdr

;- cons --> creates dotted lists
;- list --> creates proper lists
;- append --> uses cons to create lists

;NB: append sends an error if not a proper list:
;(append (reverse (cdr lst)) (car lst))
;ERROR: The object 16, passed as an argument to append, is not the correct type.