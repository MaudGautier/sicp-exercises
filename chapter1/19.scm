;Tpq(Tpq(a, b))

;Tpq(a, b) = (bq + aq + ap, bp + aq)
; =>
;Tpq(Tpq(a, b)) = Tpq(bq + aq + ap, bp + aq)
;Tpq(Tpq(a, b)) = ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p +(bq + aq + ap)q)
;Tpq(Tpq(a, b)) = (bpq + aqq + bqq + aqq + apq + bpq + apq + app, bpp + apq +bqq + aqq + apq)
;Tpq(Tpq(a, b)) = (b(2pq + qq) + a(2qq + 2pq + pp), b(pp + qq) + a(2pq + qq))
;Tpq(Tpq(a, b)) = (bQ + a(qq + 2pq) + a(qq + pp), b(pp + qq) + aQ) with Q = (2pq + qq)
;Tpq(Tpq(a, b)) = (bQ + aQ + aP, bP + aQ) with Q = (2pq + qq) and P = (qq + pp)

;Thus: Q = (2pq + qq) and P = (qq + pp)

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                  (+ (* p p) (* q q)); compute P
                  (+ (* 2 p q) (* q q)) ; compute Q
                  (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 0);0
(fib 1);1
(fib 2);1
(fib 3);2
(fib 4);3
(fib 5);5
(fib 6);8
