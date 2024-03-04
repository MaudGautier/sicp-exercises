(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;Solution from https://sicp-solutions.net/post/sicp-solution-exercise-1-27/
(define (carmichael-number? n)
  (define (try-it n a)
    (cond ((= a 1) #t)
          ((not (= (expmod a n n) a)) #f)
          (else (try-it n (- a 1)))))
  (try-it n (- n 1)))

(display (carmichael-number? 561))
(display (carmichael-number? 1105))
(display (carmichael-number? 1729))
(display (carmichael-number? 2465))
(display (carmichael-number? 2821))
(display (carmichael-number? 6601))
