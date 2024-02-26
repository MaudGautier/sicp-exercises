;This solution assumes the rectangle is flat (i.e. no angle)
;It would be more complicated otherwise 😁

;---Procedures---
(define (perimeter-rect rectangle)
  (* 2 (+ (width-rect rectangle) (height-rect rectangle))))
(define (area-rect rectangle)
  (* (width-rect rectangle) (height-rect rectangle)))

;---Points---
;Constructor
(define (make-point x y)
  (cons x y))
;Selectors
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

;---Rectangles---
; Assumes the following:
; p1
; |
; |
; p2------------------p3
(define (make-rectangle p1 p2 p3)
  (cons p1 (cons p2 p3)))
(define (p1-rect rectangle) (car rectangle))
(define (p2-rect rectangle) (car (cdr rectangle)))
(define (p3-rect rectangle) (cdr (cdr rectangle)))

(define (height-rect rectangle)
  (- (y-point (p1-rect rectangle))
     (y-point (p2-rect rectangle))))
(define (width-rect rectangle)
  (- (x-point (p3-rect rectangle))
     (x-point (p2-rect rectangle))))


(define p1 (make-point 0 3))
(define p2 (make-point 0 0))
(define p3 (make-point 10 0))
(define rectangle1 (make-rectangle p1 p2 p3))
(height-rect rectangle1);3
(width-rect rectangle1);10
(perimeter-rect rectangle1);26
(area-rect rectangle1);30
