;---Segments---
;Constructor
(define (make-segment start end)
  (cons start end))
;Selectors
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

;---Points---
;Constructor
(define (make-point x y)
  (cons x y))
;Selectors
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

;---Procedures---
(define (midpoint-segment segment)
  (let (
         (start (start-segment segment))
         (end (end-segment segment)))
    (let (
           (start-x (x-point start))
           (end-x (x-point end))
           (start-y (y-point start))
           (end-y (y-point end))
      )
      (make-point (average start-x end-x)
                  (average start-y end-y)))
    )
  )
(define (average a b)
  (/ (+ a b) 2))

;Printing
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


;---Testing---
(define p1 (make-point 1 2))
(define p2 (make-point 5 10))
(define segment1 (make-segment p1 p2))
(print-point (midpoint-segment segment1));(3,6)

