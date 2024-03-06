(load "chapter1/43")

(define dx 0.001)

(define (smooth proc)
  (lambda (x) (/
                (+
                  (proc (- x dx))
                  (proc x)
                  (proc (+ x dx))
                  )
                3
                ))
  )

(define (smooth-n proc n)
  ((repeated smooth n) proc))

;Testing
((smooth square) 2);4.000000666666667
((smooth-n square 3) 2);4.000001999999999


