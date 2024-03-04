(define (product proc start end next)
  (if (> start end)
    1
    (* (proc start) (product proc (next start) end next))
    ))

(define (inc a) (+ 1 a))
(product square 1 1 inc);1
(product square 1 2 inc);4
(product square 1 3 inc);36
