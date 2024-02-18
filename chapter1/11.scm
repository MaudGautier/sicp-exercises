;Recursive process
(define (f-rec n)
  (if (< n 3)
    n
    (+ (* 1 (f-rec (- n 1)))
       (* 2 (f-rec (- n 2)))
       (* 3 (f-rec (- n 3)))
      )
    )
  )

(f-rec 0);0
(f-rec 1);1
(f-rec 2);2
(f-rec 3);4
(f-rec 4);11
(f-rec 5);25

