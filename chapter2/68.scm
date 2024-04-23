(load "chapter2/67")

;From the book - encode procedure
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
      (encode (cdr message) tree))))

;Write encode-symbol
(define (encode-symbol symbol tree)
  (define (iter bits tree)
    (cond
      ((leaf? tree) bits)
      ((symbol-in-list? symbol (symbols (left-branch tree))) (iter (append bits (list 0)) (left-branch tree)))
      ((symbol-in-list? symbol (symbols (right-branch tree))) (iter (append bits (list 1)) (right-branch tree)))
      )
    )
  (iter '() tree)
  )

(define (symbol-in-list? symbol lst)
  (cond
    ((null? lst) #f)
    ((equal? (car lst) symbol) #t)
    (else (symbol-in-list? symbol (cdr lst))
      ))
  )

;Testing
(symbol-in-list? 'A '('B 'C)) ; Expected: #f
(symbol-in-list? 'A '(B C A)) ; Expected: #t

(encode-symbol 'A sample-tree) ; Expected: (0)
(encode-symbol 'B sample-tree) ; Expected: (1 0)
(encode-symbol 'C sample-tree) ; Expected: (1 1 1)
(encode-symbol 'D sample-tree) ; Expected: (1 1 0)

(define decoded-message '(a d a b b c a))
(encode decoded-message sample-tree) ; Expected: (0 1 1 0 0 1 0 1 0 1 1 1 0)
