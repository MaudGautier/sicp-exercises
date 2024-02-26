(define (make-interval a b)
  (cons a b))

(define (upper-bound x)
  (let ((a (car x))
         (b (cdr x)))
    (if (< a b)
      b
      a
      )
    )
  )
(define (lower-bound x)
  (let ((a (car x))
         (b (cdr x)))
    (if (< a b)
      a
      b
      )
    )
  )

(define interval (make-interval 100 10))
(lower-bound interval);10
(upper-bound interval);100