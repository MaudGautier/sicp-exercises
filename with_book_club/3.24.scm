;Try reimplenting insert! from a table without the headed list
(define (make-table-bis)
  (list))

(define (assoc-bis key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc-bis key (cdr records)))))

(define (insert-bis! key value table)
  ;--> Not possible because cannot update the table (would need to have the former "null" point to the new cons)
  (if (null? table)
    (cons (cons key value) (list))
    )
  (let ((record (assoc-bis key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)
;Testing
(define test-table (make-table-bis))
;(insert-bis! "key1" "value1" test-table)
;test-table


;3.24
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









