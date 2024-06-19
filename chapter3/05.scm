(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-pi predicate x1 x2 y1 y2 trials)
  (if (not (= (- x2 x1) (- y2 y1)))
    (error "Rectangle is not a square")
    )
  (define x-center (/ (+ x1 x2) 2))
  (define y-center (/ (+ y1 y2) 2))
  (define radius (- x2 x-center))
  (define experiment
    (lambda ()
      (define x (random-in-range x1 x2))
      (define y (random-in-range y1 y2))
      (predicate x-center y-center radius x y))
    )
  (define percentage-points-in-circle (monte-carlo trials experiment))
  (define estimated-pi (* 4.0 percentage-points-in-circle))
  estimated-pi
  )

(define (is-in-circle? x-center y-center radius x y)
  (define left-value (+ (square (- x x-center)) (square (- y y-center))))
  (define right-value (square radius))
  (<= left-value right-value))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
            (/ trials-passed trials))
      ((experiment)
        (iter (- trials-remaining 1) (+ trials-passed 1)))
      (else
        (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

;Testing
(is-in-circle? 5 7 3 5 7) ; Expected: #t
(is-in-circle? 5 7 3 2 10) ; Expected: #f
(is-in-circle? 5 7 3 2 4) ; Expected: #f
(is-in-circle? 5 7 3 8 4) ; Expected: #f
(is-in-circle? 5 7 3 8 10) ; Expected: #f
(is-in-circle? 5.0 7.0 3 5.905879836593049 7.101161363087569); Expected: #t
(estimate-pi is-in-circle? 2.0 8.0 4.0 10.0 1000) ; Expected: 3.14
(estimate-pi is-in-circle? -1.0 1.0 -1.0 1.0 1000) ; Expected: 3.14
