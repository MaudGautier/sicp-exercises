;In the Scheme-number-package
(define (install-scheme-number-package)
  ;; interface to rest of the system
  (put '=zero? 'scheme-number
    (lambda (x) (= x 0)))
  'done)

;In the rational-package
(define (install-rational-package)
  ;; interface to rest of the system
  (put '=zero? 'rational
    (lambda (x) (= (numer x) 0)))
  'done)

;In the complex-package
(define (install-complex-package)
  ;; interface to rest of the system
  (put '=zero? 'complex
    (lambda (x) (and (= (real-part x) 0) (= (imag-part x) 0))))
  'done)