(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond
      ((not (eq? p 'secret-password)) (error "Incorrect password -- " p))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE-ACCOUNT"
              m))))
  dispatch)

;Testing
(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40); Expected: 60
((acc 'wrong-password 'deposit) 60); Expected error: "Incorrect password -- wrong-password"
