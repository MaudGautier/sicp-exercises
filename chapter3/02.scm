(define (make-monitored proc)
  (define how-many-calls? 0)
  (define (dispatch op)
    (cond
      ((eq? op 'how-many-calls?) how-many-calls?)
      ((eq? op 'reset-count) (begin (set! how-many-calls? 0)) how-many-calls?)
      (else

        (begin
          (set! how-many-calls? (+ 1 how-many-calls?))
          (proc op)
          )

        )))
  dispatch
  )

;Testing
(define s (make-monitored sqrt))
(s 100) ; Expected: 10
(s 'how-many-calls?) ; Expected: 1
(s 'reset-count) ; Resets to 0; Expected: 0
(s 100) ; Expected: 10
(s 10000) ; Expected: 100
(s 'how-many-calls?) ; Expected: 2
