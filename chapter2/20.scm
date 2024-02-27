(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
  (= (remainder n 2) 1))

(define nil '())

(define (same-parity first . numbers)
  (display numbers)
  (same-parity-iter first numbers nil)
  )

(define (same-parity-iter first remaining selected)
  (if (null? remaining)
    (append (cons first nil) selected)
    (cond
      ((and (even? (car remaining)) (even? first)) (same-parity-iter first (cdr remaining) (append selected (cons (car remaining) nil))))
      ((and (odd? (car remaining)) (odd? first)) (same-parity-iter first (cdr remaining) (append selected (cons (car remaining) nil))))
      (else (same-parity-iter first (cdr remaining) selected))
      )
    )
  )



(same-parity 1 2);(1)
(same-parity 1 3);(1 3)
(same-parity 1 2 3 4 5 6 7);(1 3 5 7)
(same-parity 2 3 4 5 6 7);(2 4 6)