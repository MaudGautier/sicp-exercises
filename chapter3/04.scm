(define (make-account balance password)
  (define count-wrong-password 0)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops x)
    (newline) (display "Wrong password provided ") (display count-wrong-password) (display " times") (newline)
    (error "The cops have been called")
    )
  (define (dispatch p m)
    (cond
      ((not (eq? p 'secret-password))
        (begin
          (set! count-wrong-password (+ 1 count-wrong-password))
          (if (= count-wrong-password 3)
            (call-the-cops p))
          (error "Incorrect password --" p)))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE-ACCOUNT"
              m))))
  dispatch)

;Testing
(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40) ; Expected: 60
((acc 'wrong-password 'deposit) 1) ; Expected error: "Incorrect password -- wrong-password"
((acc 'wrong-password 'deposit) 2) ; Expected error: "Incorrect password -- wrong-password"
((acc 'wrong-password 'deposit) 3) ; Expected error: "Wrong password provided 3 times. The cops have been called"
