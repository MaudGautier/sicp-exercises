(define (product proc start end next)
  (if (> start end)
    1
    (* (proc start) (product proc (next start) end next))
    ))

(define (inc a) (+ 1 a))
(product square 1 1 inc);1
(product square 1 2 inc);4
(product square 1 3 inc);36

(define (factorial n)
  (product (lambda (x) x) 1 n inc))

(factorial 1);1
(factorial 2);2
(factorial 3);6
(factorial 4);24
(factorial 5);120

(define (product-2 proc start end next)
  (define (iter i result)
    (if (> i end)
      result
      (iter (next i) (* result (proc i)))
      )
    )
  (iter start 1)
  )

(product-2 square 1 1 inc);1
(product-2 square 1 2 inc);4
(product-2 square 1 3 inc);36
