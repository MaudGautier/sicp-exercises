(define (range n)
  (if (= 0 n)
    (list)
    (append (range (- n 1)) (list n))
    ))

(define (flatten lst)
  (if (null? lst)
    lst
    (append (car lst) (flatten (cdr lst))))
  )

(define (flatmap function lst)
  flatten (map function lst))

(define (not-filtered-triples-summing-to n s)
  (flatten
    (map (lambda (i)
           (map (lambda (j) (list i j (- s (+ j i)))) (range (- i 1))))
      (range n)
      )
    )
  )

(not-filtered-triples-summing-to 4 5) ; Expected: ((2 1 2) (3 1 1) (3 2 0) (4 1 0) (4 2 -1) (4 3 -2))

(define (filter-empty lst)
  (cond
    ((null? lst) lst)
    ((null? (car lst)) (filter-empty (cdr lst)))
    (else
      (append (list (car lst)) (filter-empty (cdr lst))))
    ))

(define (triples-summing-to n s)
  (filter-empty
    (flatten
      (map (lambda (i)
             (map
               (lambda (j) (if (<= (- s (+ j i)) 0)
                             (list)
                             (list i j (- s (+ j i)))))
               (range (- i 1))))
        (range n)
        )
      )
    )
  )

(triples-summing-to 4 5) ; Expected: ((2 1 2) (3 1 1))

