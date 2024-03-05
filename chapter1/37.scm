(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))
      )
    )
  (iter k 0)
  )

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10000) ;.6180339887498948

;;Wrong because recursing in the wrong direction (k-1 instead of k+1)
;(define (cont-frac-rec n d k)
;  (if (= k 1)
;    (/ (n k) (d k))
;    (/ (n k) (+ (d k) (cont-frac-rec n d (- k 1))))
;    )
;  )
(define (cont-frac-rec n d k)
  (define (recur i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cont-frac-rec n d (+ i 1))))
      )
    )
  (recur 1)
  )

(cont-frac-rec (lambda (i) 1 .0) (lambda (i) 1 .0) 10000) ;.6180339887498948
