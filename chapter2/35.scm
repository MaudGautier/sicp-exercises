(define (accumulate proc initial sequence)
   (if (null? sequence)
       initial
       (proc (car sequence)
             (accumulate proc initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree tree))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))
    )
  )


(count-leaves (list 1 2 (list 3 4 (list 5 6) (list 7))))