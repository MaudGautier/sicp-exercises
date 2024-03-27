;Let's prove that if 2^a * 3^b == 2^c * 3^d THEN a == c and b == d

;2^a * 3^b == 2^c * 3^d
;2^(a-c) * 3^(b-d) == 1
;Then a = c and b = d
;Hurray! 🎉

(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

;18 -> / 3 -> 6 -> / 3 -> 2
;2 ^1*3^2

(define (cons a b)
  (* (fast-expt 2 a) (fast-expt 3 b)))
(define (car x)
  (factor x 2)
  )
(define (cdr x)
  (factor x 3)
  )
(define (factor n prime)
  (define (iter i nb-steps)
    (if (= (remainder i prime) 0)
      (iter (/ i prime) (+ nb-steps 1))
      nb-steps
      )
    )
  (iter n 0)
  )
(factor 256 2) ;8
(factor 8 2) ;3
(factor 24 2) ;3

(car (cons 12 345));12
(cdr (cons 12 345));345
