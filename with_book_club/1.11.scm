;------ RECURSIVE ------
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
      (* 2 (f (- n 2)))
      (* 3 (f (- n 3)))
      )
    )
  )

(f 0) ;0
(f 1) ;1
(f 2) ;2
(f 3) ;2 + 2 + 0 => 4
(f 4) ;4 + 4 + 3 => 11


;------ ITERATIVE (from 0 to n) ------

(define (f-2 n)
  (if (< n 3)
    n
    (f-iter n 3 2 1 0)
    )
  )

;a -> n-1
;b -> n-2
;c -> n-3
(define (f-iter threshold current-i a b c)
  (let ((new-value (+ a (* 2 b) (* 3 c))))
    (if (= current-i threshold)
      new-value
      (f-iter threshold (+ 1 current-i) new-value a b)
      )
    )
  )


(f-2 3);4
(f-2 4);11


;------ ITERATIVE (from n to 0) (Laurent's version) ------


(define (characteristic a b c)
  (+ a (* 2 b) (* 3 c))
)
; iterative process
(define (f_ n)
  (define (fi v1 v2 v3 n)
    (cond ((< n 2) n)
          ((= n 2) v1)
          (else (fi (characteristic v1 v2 v3) v1 v2 (- n 1)))
     ))
  (fi 2 1 0 n)
)

(f_ 0);0
(f_ 1);1
(f_ 2);2
(f_ 3);4
(f_ 4);11

