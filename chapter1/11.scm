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

;Iterative process
(define (f-iter target current a b c)
  (define new-value (+ a (* 2 b) (* 3 c)))
  (cond ((< target 3) target)
        ((= target current) a)
        (else (f-iter target (+ current 1) new-value a b)))
  )


(define (f-iter-init n)
  (f-iter n 2 2 1 0)
  )

(f-iter-init 0);0
(f-iter-init 1);1
(f-iter-init 2);2
(f-iter-init 3);4
(f-iter-init 4);11
(f-iter-init 5);25