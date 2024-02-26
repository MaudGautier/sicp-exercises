(load "chapter2/07")

;6.8 ohms with 10% tolerance (6.12 -> 7.48) MINUS 4.7 ohms with 5% tolerance (4.46 -> 4.9)
; =>   6.12 - 4.9  --->  7.48 - 4.46
; lower-bound - upper-bound --->  upper-bound - lower-bound

(define (sub-interval interval1 interval2)
  (make-interval (- (lower-bound interval1) (upper-bound interval2))
                 (- (upper-bound interval1) (lower-bound interval2))
    )
  )

;Tests
(define interval1 (make-interval 3 10))
(define interval2 (make-interval 1 3))
(sub-interval interval1 interval2);(0,9)