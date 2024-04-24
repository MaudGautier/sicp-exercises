(define (range n)
  (if (= 0 n)
    (list)
    (append (range (- n 1)) (list n))
    ))

(range 5) ; Expected: (1 2 3 4 5)

(define (flatten lst)
  (if (null? lst)
    lst
    (append (car lst) (flatten (cdr lst))))
  )

(define (flatmap function lst)
  flatten (map function lst))

(define (unique-pairs n)
  (flatten
    (map (lambda (i)
           (map (lambda (j) (cons i j)) (range (- i 1))))
      (range n)
      )
    )
  )

(unique-pairs 4) ; Expected: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))