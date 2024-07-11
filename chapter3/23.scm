; Constructors
(define (make-queue)
  (list '() '()))
(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (set-item! element item) (set-car! element item))
(define (set-previous! element item) (set-car! (cdr element) item))
(define (set-next! element item) (set-cdr! (cdr element) (cons item '())))

(define (value element) (car element))
(define (previous element) (car (cdr element)))
(define (next element) (car (cdr (cdr element))))
;(define (before-last-ptr deque) (cadr deque))
;(define (rear-ptr deque) (cddr deque))
;(define (set-front-ptr! deque item) (set-car! deque item))
;;(define (set-before-last-ptr! deque item) (set-car! (cdr deque) item))
;(define (set-rear-ptr! deque item) (set-cdr! (cdr deque) (cons item '())))

;; Some tests to mutate a list
;(define a (list 1 2 3));Value: a
;(set-car! a 4);Unspecified return value
;a;Value: (4 2 3)
;(set-car! (cdr a) 5);Unspecified return value
;a;Value: (4 5 3)
;(set-cdr! (cdr a) (cons 6 '()));Unspecified return value
;a;Value: (4 5 6)

; Predicate
(define (empty-deque? deque)
  (null? (front-ptr deque)))

; Selectors
(define (front-deque deque)
  (if (empty-deque? deque)
    (error "Front called with an empty queue")
    (car (front-ptr deque))
    ))

(define (rear-deque deque)
  (if (empty-deque? deque)
    (error "Rear called with an empty queue")
    (car (rear-ptr deque))
    )
  )

; Mutators
(define (front-insert-deque! deque item)
  (let ((new-pair (list item '() '())))
    (cond ((empty-deque? deque)
            ;            (newline) (display "new pair=") (display new-pair)
            (set-front-ptr! deque new-pair)
            (set-rear-ptr! deque new-pair)
            ;            (newline) (display "deque=") (display deque)
            ;            (newline) (display "front-ptr=") (display (front-ptr deque))
            ;            (newline) (display "rear-ptr=") (display (rear-ptr deque))
            deque)
      (else
        (set-next! new-pair (front-ptr deque))
        (set-previous! (front-ptr deque) new-pair)
        (set-front-ptr! deque new-pair)
        deque)
      )
    )
  )

(define (rear-insert-deque! deque item)
  (let ((new-pair (list item (rear-ptr deque) '())))
    (cond ((empty-deque? deque)
            (set-front-ptr! deque new-pair)
            (set-rear-ptr! deque new-pair)
            deque
            )
      (else
        (set-next! (rear-ptr deque) new-pair)
        (set-rear-ptr! deque new-pair)
        deque))
    )
  )

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
          (error "Front delete called on an empty queue"))
    (else
      (set-front-ptr! deque (next (front-ptr deque)))
      (set-previous! (front-ptr deque) '())
      deque)
    )
  )

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
          (error "Rear delete called on an empty queue"))
    (else
      (set-rear-ptr! deque (previous (rear-ptr deque)))
      (set-next! (rear-ptr deque) '())
      deque)
    )
  )

; Helpers
(define (print-deque deque)
  (front-ptr deque))

(define (print-values deque)
  (define current (car deque))
  (if (null? current)
    '()
    (cons (value current) (print-values (cddr current)) )
    )
  )

; Testing
(define deque (make-queue))
(front-insert-deque! deque 'b)
;(print-deque deque)
(print-values deque) ; Expected: (b)
(front-insert-deque! deque 'a)
;(print-deque deque)
(print-values deque) ; Expected: (a b)
(rear-insert-deque! deque 'c)
;(print-deque deque)
(print-values deque) ; Expected: (a b c)
(rear-insert-deque! deque 'd)
;(print-deque deque)
(print-values deque) ; Expected: (a b c d)
(rear-delete-deque! deque)
;(print-deque deque)
(print-values deque) ; Expected: (a b c)
(front-delete-deque! deque)
;(print-deque deque)
(print-values deque) ; Expected: (b c)
