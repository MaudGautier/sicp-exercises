;(define (assoc key records)
;  (cond ((null? records) false)
;    ((equal? key (caar records)) (car records))
;    (else (assoc key (cdr records)))))

;Helper functions
(define (make-tree entry left right) (list entry left right))
(define (make-leaf entry) (list entry '() '()))
(define (get-entry tree) (car tree))
(define (set-entry! tree entry) (set-car! tree entry))
(define (left-branch tree) (cadr tree))
(define (set-left-branch! tree entry) (set-entry! (cdr tree) entry))
(define (right-branch tree) (caddr tree))
(define (set-right-branch! tree entry) (set-entry! (cddr tree) entry))
(define (make-record key value) (cons key value))
(define (get-key record) (car record))
(define (get-value record) (cdr record))

(define (make-table)
  (let ((local-table (list '*table*)))
    (let ((tree (make-tree '() '() '())))
      (set-cdr! local-table tree)

      (define (insert! key value)
        (if (null? (get-entry tree))
          (set-entry! tree (make-record key value))
          (node-insert! key value tree)
          )
        )

      (define (node-insert! key value node)
;        (newline) (display "key=") (display key) (display ",value=") (display value) (display ",node=") (display node)
        (cond
          ((null? (get-entry node)) (set-entry! node (make-record key value)))
          ((= key (get-key (get-entry node))) (set-entry! node (make-record key value)))
          ((< key (get-key (get-entry node)))
            (if (null? (left-branch node)) (set-left-branch! node (make-leaf (make-record key value))) (node-insert! key value (left-branch node))))
          ((> key (get-key (get-entry node)))
            (if (null? (right-branch node)) (set-right-branch! node (make-leaf (make-record key value))) (node-insert! key value (right-branch node))))
          )
        )

      (define (lookup key)
        (node-lookup key tree)
        )

      (define (node-lookup key node)
        (cond
          ((null? node) #f)
          ((= key (get-key (get-entry node))) (get-value (get-entry node)))
          ((< key (get-key (get-entry node))) (node-lookup key (left-branch node)))
          ((> key (get-key (get-entry node))) (node-lookup key (right-branch node)))
          )

        )


      ;    (define (lookup keys)
      ;      (recursive-lookup keys local-table))
      ;
      ;    (define (recursive-lookup keys table)
      ;      (if (null? keys)
      ;        (cdr table)
      ;        (let ((subtable (assoc (car keys) (cdr table))))
      ;          (if subtable
      ;            (recursive-lookup (cdr keys) subtable)
      ;            false
      ;            )
      ;          )
      ;        ))

      ;      (recursive-insert! keys value local-table))
      ;
      ;    (define (recursive-insert! keys value table)
      ;      (let ((subtable (assoc (car keys) (cdr table))))
      ;        (if subtable
      ;          (recursive-insert! (cdr keys) value subtable)
      ;          (set-cdr! table
      ;            (cons
      ;              (initialize-subtable keys value)
      ;              (cdr table)))
      ;          )
      ;        )
      ;      )

      (define (dispatch m)
        (cond
          ((eq? m 'lookup-proc) lookup)
          ((eq? m 'insert-proc!) insert!)
          (else (error "Unknown operation -- TABLE" m))))
      dispatch)))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

;Testing
(put 5 "e")
(put 2 "b")
(put 1 "a")
(put 3 "c")
(put 4 "d")
(put 6 "f")
(put 7 "g")
(put 8 "h")
(get 5) ; Expected: "e"
(get 8) ; Expected: "h"
(get 3) ; Expected: "c"
(get 10) ; Expected: #f