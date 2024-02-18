(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;(define (p) (p)) defines an infinite loop

;If applicative order:
;Infinite loop before calling test

;If normal order:
;Return 0

;Reference: https://stackoverflow.com/questions/12377954/sicp-exercise-1-5-and-1-6