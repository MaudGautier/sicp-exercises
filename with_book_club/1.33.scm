;Ex 1.32: Define `accumulate`
(define (accumulate combiner null-value term a next b)
  (define (iter i result)
    (if (> i b)
      result
      (iter (next i) (combiner result (term i)))
      ))
  (iter a null-value)
  )

;Testing `accumulate`
(define (inc x) (+ x 1))
(define (factorial x)
  (accumulate * 1 (lambda (x) x) 1 inc x)
  )
(factorial 5);120

;Ex 1.33: Define accumulate with filtering (version 1)
(define (filtered-accumulate filter-predicate combiner null-value term a next b)
  (define (iter i accumulation)
    (if (> i b)
      accumulation
      (if (filter-predicate i)
        (iter (next i) (combiner accumulation (term i)))
        (iter (next i) accumulation)
        )
      )
    )
  (iter a null-value)
  )

;Testing `filtered-accumulate`
(define (my-sum-even x)
  (filtered-accumulate even? + 0 (lambda (x) x) 0 inc x)
  )
(my-sum-even 5);6


;Bonus: rewrite `accumulate` in terms of `filtered-accumulate`
(define (new-accumulate combiner null-value term a next b)
  (filtered-accumulate (lambda (x) true) combiner null-value term a next b)
  )

;Testing `new-accumulate`
(define (new-factorial x)
  (new-accumulate * 1 (lambda (x) x) 1 inc x)
  )
(new-factorial 5) ;120

;Bonus: rewrite `filtered-accumulate` in terms of `accumulate`
(define (new-filtered-accumulate filter-predicate combiner null-value term a next b)
  ;Redefining the `next` to apply filter followed by next
  (define (filtered-next x)
    (if (filter-predicate (next x))
      (next x)
      ;Return `next x` if greater than b so that we avoid running in an infinite loop
      (if (> (next x) b)
        (next x)
        (filtered-next (next x))
        )
      )
    )
  (accumulate combiner null-value term a filtered-next b)
  )

;Testing `new-filtered-accumulate`
(define (my-new-sum-even x)
  (new-filtered-accumulate even? + 0 (lambda (x) x) 0 inc x)
  )
(my-new-sum-even 5) ;6
