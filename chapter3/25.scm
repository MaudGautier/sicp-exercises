(define (assoc key records)
  (cond ((null? records) false)
    ((equal? key (caar records)) (car records))
    (else (assoc key (cdr records)))))

(define (make-table)
  (let ((local-table (list '*table*)))

    (define (lookup keys)
      (recursive-lookup keys local-table))

    (define (recursive-lookup keys table)
;      (newline)
;      (newline) (display "keys=") (display keys)
;      (newline) (display "table=") (display table)
      (if (null? keys)
        (cdr table)
        (let ((subtable (assoc (car keys) (cdr table))))
;          (newline) (display "subtable=") (display subtable)
          (if subtable
            (recursive-lookup (cdr keys) subtable)
            false
            )
          )
        ))

    (define (insert! keys value)
      (recursive-insert! keys value local-table))

    (define (recursive-insert! keys value table)
      (let ((subtable (assoc (car keys) (cdr table))))
        (if subtable
          (recursive-insert! (cdr keys) value subtable)
          (set-cdr! table
            (cons
              (initialize-subtable keys value)
              (cdr table)))
          )
        )
      )

    (define (dispatch m)
      (cond
        ((eq? m 'lookup-proc) lookup)
        ((eq? m 'insert-proc!) insert!)
        (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))


(define (initialize-subtable keys value)
  (if (null? (cdr keys))          ; Check if this is the last key
    (cons (car keys) value)       ; If it's the last key, return a pair of the key and the value
    (list (car keys)              ; Otherwise, create a list with the current key and the result of the recursive call
          (initialize-subtable (cdr keys) value))))

;Other version - iterative
;(define (initialize-subtable keys value)
;  (define (iter keys current-subtable)
;    (if (null? keys)
;      current-subtable
;      (iter (cdr keys) (list (car keys) current-subtable)))
;    )
;  (iter (reverse keys) value)
;  )

;Testing
(initialize-subtable '("key1") "value") ; Expected: ("key1" . "value")
(initialize-subtable '("key1" "key2") "value") ; Expected: ("key1" ("key2" . "value")
(initialize-subtable '("key1" "key2" "key3") "value") ; Expected: ("key1" ("key2" ("key3" . "value")))


(define three-level-table (make-table))
(put '("letters" "upper-case" "A") 65)
(put '("letters" "lower-case" "a") 97)
(put '("letters" "upper-case" "B") 66)
(put '("letters" "lower-case" "b") 98)
(put '("math" "simple" "+") 43)

(get '("letters" "upper-case" "A")); Expected: 65
(get '("letters" "lower-case" "a")); Expected: 97
(get '("math" "simple" "+")); Expected: 43
(get '("math" "does-not-exist" "+")); Expected: #f
