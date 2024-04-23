(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree)) (define (right-branch tree) (cadr tree)) (define (symbols tree)
                                                                                  (if (leaf? tree)
                                                                                    (list (symbol-leaf tree)) (caddr tree)))
(define (weight tree) (if (leaf? tree)
                        (weight-leaf tree)
                        (cadddr tree)))


(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))



(define sample-tree (make-code-tree (make-leaf 'A 4)
                      (make-code-tree
                        (make-leaf 'B 2)
                        (make-code-tree
                          (make-leaf 'D 1)
                          (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))


(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
    ((= bit 1) (right-branch branch))
    (else (error "bad bit: CHOOSE-BRANCH" bit))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits) '()
                     (let ((next-branch
                             (choose-branch (car bits) current-branch)))
                       (if (leaf? next-branch)
                         (cons (symbol-leaf next-branch)
                           (decode-1 (cdr bits) tree))
                         (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(decode sample-message sample-tree) ;


;68
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (iter bits tree)
    (cond
      ((leaf? tree) bits)
      ((symbol-in-list? symbol (symbols (left-branch tree))) (iter (append bits (list 0)) (left-branch tree)))
      ((symbol-in-list? symbol (symbols (right-branch tree))) (iter (append bits (list 1)) (right-branch tree)))
      )
    )

  (if (not (symbol-in-list? symbol (symbols tree)))
    (error "Not in the tree")
    (iter '() tree)
    )
  )

(define (symbol-in-list? symbol lst)
  ;  (newline) (display "symbol=") (display symbol)
  ;  (newline) (display "lst=") (display lst)
  (cond
    ((null? lst) #f)
    ((equal? symbol (car lst)) #t)
    (else (symbol-in-list? symbol (cdr lst))
      )))

; Testing
(eq? 'apple 'apple) ; #t
;(= 'apple 'apple); error
(equal? 'apple 'apple) ; #t

(symbol-in-list? 'A '('B 'C)) ; Expected: #f
(symbol-in-list? 'A '(B C A)) ; Expected: #t


(define decoded-message '(a d a b b c a))
(encode decoded-message sample-tree) ; Expected: (0 1 1 0 0 1 0 1 0 1 1 1 0)



; ----- 69
(define (adjoin-set x set)
  (cond ((null? set) (list x))
    ((< (weight x) (weight (car set))) (cons x set))
    (else (cons (car set)
            (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                    (cadr pair))
        ; symbol
        ; frequency
        (make-leaf-set (cdr pairs))))))

(make-leaf-set '((A 4) (B 2) (C 1) (D 1))) ; Expected: ((leaf d 1) (leaf c 1) (leaf b 2) (leaf a 4))

(define (successive-merge pairs)
  (newline) (display "pairs=") (display pairs)
  (if (null? (cdr pairs))
    (begin
      (newline) (display "IF IS TRUE")
      (car pairs))
    (begin
      (let (
             (first-merged-pair (make-code-tree (car pairs) (cadr pairs)))
             (rest-pairs (cddr pairs))
             )
        (let (
               (new-pairs (adjoin-set first-merged-pair rest-pairs))
               )
          (successive-merge (adjoin-set
                              first-merged-pair
                              (cddr pairs)))
          )
        )
      )
    )
  )



(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;Testing
(define huffman-tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
huffman-tree ; Expected: ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)
(decode (encode '(a d a b b c a) huffman-tree) huffman-tree) ; Expected: '(a d a b b c a)

