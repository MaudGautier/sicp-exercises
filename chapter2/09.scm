(load "chapter2/08")

(define (width interval)
  (let (
         (difference (- (upper-bound interval) (lower-bound interval)))
         )
    (/ difference 2)))

(define interval1 (make-interval 0 10))
(width interval1);5

;(define (add-interval x y)
;(make-interval (+ (lower-bound x) (lower-bound y))
;                 (+ (upper-bound x) (upper-bound y))))

;;Proof by using the substitution model
;Given:
;2*Xw = Xu - Xl
;2*Yw = Yu - Yl
;Z = X + Y
;Zl = Xl + Yl
;Zu = Xu + Yu
;Then
;2*Zw = Zu - Zl
;2*Zw = (Xu + Yu) - (Xl + Yl)
;2*Zw = (Xu - Xl) + (Yu - Yl)
;2*Zw = 2*Xw + 2*Yw
;Zw = Xw + Yw


