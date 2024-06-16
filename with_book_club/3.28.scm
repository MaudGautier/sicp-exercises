;• (get-signal ⟨ wire ⟩)
;returns the current value of the signal on the wire.
;• (set-signal! ⟨ wire ⟩ ⟨ new value ⟩)
;changes the value of the signal on the wire to the new value.
;• (add-action! ⟨ wire ⟩ ⟨ procedure of no arguments⟩)
;asserts that the designated procedure should be run whenever
;the signal on the wire changes value. Such procedures are the
;vehicles by which changes in the signal value on the wire are
;communicated to other wires.

(define (make-wire)
  (let ((signal-value 0) (action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
        (begin (set! signal-value new-value)
               (call-each action-procedures))
        'done))
    (define (accept-action-procedure! proc)
      (set! action-procedures
        (cons proc action-procedures))
      (proc))
    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
        ((eq? m 'set-signal!) set-my-signal!)
        ((eq? m 'add-action!) accept-action-procedure!)
        (else (error "Unknown operation: WIRE" m))))
    dispatch))


(define (get-signal wire) (wire 'get-signal))
(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))
(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))


(define (call-each procedures)
  (if (null? procedures)
    'done
    (begin ((car procedures))
           (call-each (cdr procedures)))))


; a1, a2 and output are *wires*
(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
            (logical-and (get-signal a1) (get-signal a2))))
      (after-delay
        and-gate-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)




; AND truth table
; a   b  output
; 0   0    0
; 1   0    0
; 0   1    0
; 1   1    1


;Exercise 3.28: Deﬁne an or-gate as a primitive function
;box. Your or-gate constructor should be similar to and-gate.

;(define logical-or or)
(define (logical-or a b)
  (cond
    ((or (= a 1) (= b 1)) 1)
    (else 0)
    )
  )

(logical-or 0 1)
;expected 1
(logical-or 0 0)
;expected 0

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
            (logical-or (get-signal a1) (get-signal a2))))
      (after-delay
        or-gate-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)



(define or-gate-delay 1)
(define and-gate-delay 1)

; skipping delay so we can test gates
(define (after-delay delay procedure)
  (procedure)
  )


(define a1 (make-wire))
(define a2 (make-wire))
(define a3 (make-wire))
(or-gate a1 a2 a3)
(set-signal! a1 1)
(set-signal! a2 0)
(get-signal a3)
;expected 1
(set-signal! a1 0)
(set-signal! a2 0)
(get-signal a3)
;expected 0
