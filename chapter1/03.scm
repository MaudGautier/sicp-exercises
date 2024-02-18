(define (sum-largest-squares a b c)
  (define smallest (smallest? a b c))
  (cond
    ((= smallest a) (sum-squares b c))
    ((= smallest b) (sum-squares a c))
    ((= smallest c) (sum-squares a b))
    )
  )

(define (sum-squares x y)
  (+ (square x) (square y))
  )

(define (square x)
  (* x x))

(define (smallest? i j k)
  (if (< i j)
      (smallest-pair? i k)
      (smallest-pair? j k))
  )

(define (smallest-pair? i j)
  (if (< i j)
      i
      j)
  )


;Test
(sum-largest-squares 1 2 3) ;13
(sum-largest-squares -10 -20 2) ;104
(sum-largest-squares 0 0 0) ;0
