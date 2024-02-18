(define (double n)
  (* 2 n))
(define (halve n)
  (/ n 2))
(define (even? n)
  (= (remainder n 2) 0))

;(define (fast-multiply a b)
;;  (display "fast-mult: ") (display a) (display " * ") (display b)  (newline)
;  (if (or (= b 0) (= a 0))
;      0
;      (if (even? b)
;          (double (fast-multiply a (halve b)))
;          (+ (fast-multiply a (- b 1)) a)
;        )
;    )
;  )

(define (fast-multiply-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-multiply-iter (double a) (halve b) c))
        (else (fast-multiply-iter a (- b 1) (+ c a)))
    )
  )

(fast-multiply-iter 3 4 0);12
(fast-multiply-iter 17 19 0);323