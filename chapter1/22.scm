(load "chapter1/21")


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

;(timed-prime-test 100000000171);0.17 seconds



(define (search-for-primes minimum maximum)
  (if (even? minimum)
    (search-for-primes (+ 1 minimum) maximum)
    (if (> minimum maximum)
      (display "Finished")
      (begin
        (timed-prime-test minimum)
        (search-for-primes (+ 2 minimum) maximum))
      )
    ))

(newline)
(display "First 3 over 1000")
(search-for-primes 1000 1020)
(newline)
(display "First 3 over 10000")
(search-for-primes 10000 10038)
(newline)
(display "First 3 over 100000")
(search-for-primes 100000 100044)