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
      ((not (eq? p password)) (error "Incorrect password -- " p))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request -- MAKE-ACCOUNT"
              m))))
  dispatch)

;Testing
(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40) ; Expected: 60

(define (make-joint original-account original-account-password joint-account-password)
  (define (dispatch password action)
    (cond
      ((not (eq? password joint-account-password)) (error "Unauthorized: Incorrect password --" password))
      (else (original-account original-account-password action))
      )
    )
  dispatch
  )


;TODO:
; - check old-password corresponds to other account (otherwise fail)
; - able to use withdraw and deposit from other account

;Testing
(define peter-acc (make-account 100 'peter-password))
(define paul-acc (make-joint peter-acc 'peter-password 'paul-password))
;((paul-acc 'wrong-paul-password 'withdraw) 60); Expected error: Unauthorized: Incorrect password -- wrong-paul-password

((paul-acc 'paul-password 'withdraw) 60); Expected: 40
((paul-acc 'paul-password 'deposit) 100); Expected: 140
((peter-acc 'peter-password 'deposit) 10); Expected: 150
