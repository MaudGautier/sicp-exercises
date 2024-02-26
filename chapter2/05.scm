;Primitive for expt:
(expt 2 2);4
(expt 2 3);8

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (car-iter x 0))
(define (car-iter x count)
  (if (= 0 (remainder x 2))
    (car-iter (/ x 2) (+ 1 count))
    count
    ))

(define (cdr x)
  (cdr-iter x 0))
(define (cdr-iter x count)
  (if (= 0 (remainder x 3))
    (cdr-iter (/ x 3) (+ 1 count))
    count
    ))

(car (cons 3 10));3
(cdr (cons 3 10));10
