; Given
(define (make-wire)
  (let ((signal-value 0) (action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
        (begin (set! signal-value new-value)
               (call-each action-procedures))
        'done))
    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))
    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
        ((eq? m 'set-signal!) set-my-signal!)
        ((eq? m 'add-action!) accept-action-procedure!)
        (else (error "Unknown operation -- WIRE" m))))
    dispatch))
(define (get-signal wire)
  (wire 'get-signal))
(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))
(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))


; Exercise

(define (logical-or a1 a2)
  (cond
    ((= a1 1) 1)
    ((= a2 1) 1)
    (else 0)
    )
  )

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay (lambda () (set-signal! output new-value)))
      )
    )
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  )

; Testing
(define a1 (make-wire))
(define a2 (make-wire))
(define output (make-wire))
(define or-gate-1 a1 a2 output)
()