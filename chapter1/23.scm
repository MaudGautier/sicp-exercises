;Smallest divisor
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next test-divisor)))
    )
  )
(define (divides? a b)
  (= (remainder b a) 0))

;Re-implementation of next
(define (next n)
  (if (= 2 n) 3 (+ 2 n)))

;Time
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
(define (prime? n)
  (= n (smallest-divisor n)))

;Testing
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)

(timed-prime-test 100000000171);0.11 seconds (=> faster than 0.17 seconds with other implementation)
