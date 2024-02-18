(define (pascal i j)
  (cond ((= j 0) 1)
        ((< i j) 0)
        (else (+ (pascal (- i 1) (- j 1))
                 (pascal (- i 1) j)
                ))
    )
  )

(pascal 0 0);1
(pascal 0 1);1
(pascal 1 0);0
(pascal 1 1);1
(pascal 2 1);2
(pascal 3 1);3
(pascal 4 1);4
(pascal 4 2);6
(pascal 4 3);4