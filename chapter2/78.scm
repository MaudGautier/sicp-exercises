;;From the book - tagged data
;(define (attach-tag type-tag contents)
;  (cons type-tag contents))
;(define (type-tag datum)
;  (if (pair? datum)
;    (car datum)
;    (error "Bad tagged datum: TYPE-TAG" datum)))
;(define (contents datum)
;  (if (pair? datum)
;    (cdr datum)
;    (error "Bad tagged datum: CONTENTS" datum)))

;Updated version to take advantage of Scheme's internal type system
(define (attach-tag type-tag contents)
  (cond
    ((number? contents) contents)
    (else (cons type-tag contents))
    )
  )
(define (type-tag datum)
  (cond
    ((number? datum) 'scheme-number)
    ((pair? datum) (car datum))
    (else (error "Bad tagged datum: TYPE-TAG" datum))))
(define (contents datum)
  (cond
    ((number? datum) datum)
    ((pair? datum) (cdr datum))
    (else (error "Bad tagged datum: CONTENTS" datum))))
