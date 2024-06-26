(define (random-update x)
  (+ x 1))
(define random-init 0)

(define rand
  (let ((seed random-init))
    (define (dispatch symbol)
      (cond
        ((eq? symbol 'generate)
          (begin
            (set! seed (random-update seed))
            seed))
        ((eq? symbol 'reset) (lambda (new-init) (set! seed new-init)))
        )
      )
    dispatch
    )
  )

;Testing
;(rand)
(rand 'generate) ;1
(rand 'generate) ;2
((rand 'reset) 4)
(rand 'generate) ;5