(load "chapter1/42")

(define (repeated proc repetitions)
  (if (= repetitions 1)
    proc
    (compose proc (repeated proc (- repetitions 1)))
    )
  )

;Testing
((repeated square 2) 5);625