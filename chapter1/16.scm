(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 5);32
(fast-expt 4 2);16

;Needs to be initialized with a = 1
(define (iter-fast-expt b n a)
  (cond ((= n 0) a)
        ((even? n) (iter-fast-expt (square b) (/ n 2) a))
        (else (iter-fast-expt b (- n 1) (* b a)))
    )
  )

(iter-fast-expt 2 5 1);32
(iter-fast-expt 4 2 1);16
