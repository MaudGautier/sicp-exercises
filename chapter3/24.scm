(define (assoc key records same-key-proc?)
  (cond ((null? records) false)
    ((same-key-proc? key (caar records)) (car records))
    (else (assoc key (cdr records) same-key-proc?))))


(define (make-table same-key?)
  (define table (list '*table*))

  (define (lookup key)
    (let ((record (assoc key (cdr table) same-key?)))
      (if record
        (cdr record)
        false)))

  (define (insert! key value)
    (let ((record (assoc key (cdr table) same-key?)))
      (if record
        (set-cdr! record value)
        (set-cdr! table
          (cons (cons key value) (cdr table)))))
    'ok)

  (define (dispatch m)
    (cond
      ((eq? m 'insert-proc!) insert!)
      ((eq? m 'lookup-proc) lookup)
      ))
  dispatch
)

(define (test-same-key? key1 key2)
  (define tolerance 0.1)
  (< (abs (- key1 key2)) tolerance)
  )

(define operation-table (make-table test-same-key?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

;Testing
(put 10 "value1")
(put 20 "value2")
(put 30 "value3")
(get 30); Expected: "value3"
(get 20.05); Expected: "value2"
(put 30.03 "value4")
(get 30); Expected: "value4"
;operation-table; Expected
