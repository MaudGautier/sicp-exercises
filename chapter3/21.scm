; -- From the book
; Constructors
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

; Helper functions
(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

; Getters
(define (front-queue queue)
  (if (empty-queue? queue)
    (error "FRONT called with an empty queue" queue)
    (car (front-ptr queue))))

; Methods
(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
            (set-front-ptr! queue new-pair)
            (set-rear-ptr! queue new-pair)
            queue)
      (else
        (set-cdr! (rear-ptr queue) new-pair)
        (set-rear-ptr! queue new-pair)
        queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
          (error "DELETE! called with an empty queue" queue))
    (else
      (set-front-ptr! queue (cdr (front-ptr queue)))
      queue)))

; -- From the exercise
(define (print-queue queue)
  (front-ptr queue)
  )


;Testing
(define q1 (make-queue))
(insert-queue! q1 'a)
(print-queue q1) ;Expected: (a)
(insert-queue! q1 'b)
(print-queue q1) ;Expected: (a b)
(delete-queue! q1)
(print-queue q1) ;Expected: (b)
(delete-queue! q1)
(print-queue q1) ;Expected: ()
