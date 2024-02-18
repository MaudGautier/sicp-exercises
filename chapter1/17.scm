(define (double n)
  (* 2 n))
(define (halve n)
  (/ n 2))
(define (even? n)
;  (display "in even --> ") (display n)  (newline)
  (= (remainder n 2) 0))

(define (fast-multiply a b)
;  (display "fast-mult: ") (display a) (display " * ") (display b)  (newline)
  (if (or (= b 0) (= a 0))
      0
      (if (even? b)
          (double (fast-multiply a (halve b)))
          (+ (fast-multiply a (- b 1)) a)
        )
    )
  )

; 10 * 12
; double(10 * 6)
; double(double(10 * 3))
; double(double(10 * 2 + 10))
; double(double(double(10) + 10))
;
(fast-multiply 1 1);1
(fast-multiply 1 3);3
(fast-multiply 0 3);0
(fast-multiply 2 2);4
(fast-multiply 2 3);6
(fast-multiply 2 4);8
(fast-multiply 3 4);12
(fast-multiply 100 300);30000