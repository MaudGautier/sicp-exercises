;Smallest divisor
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ 1 test-divisor)))
    )
  )
(define (divides? a b)
  (= (remainder b a) 0))

;Time
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;Use fast-prime? instead of prime?
(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
      (remainder
        (square (expmod base (/ exp 2) m))
        m))
    (else
      (remainder
        (* base (expmod base (- exp 1) m))
        m))))
;(define (fast-prime? n)
;  (= n (smallest-divisor n)))

(timed-prime-test 100000000171) ;0 seconds (=> faster than 0.17 seconds with other implementation)
