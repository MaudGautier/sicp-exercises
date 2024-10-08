;From the book - constructor and selector of a leaf
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

;From the book - constructor for a tree
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

;From the book - selectors for a tree (left and right branches, symbols, weight)
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree)) (caddr tree)))
(define (weight tree) (if (leaf? tree)
                        (weight-leaf tree)
                        (cadddr tree)))

;From the book - decode message based on huffman tree
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch
              (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
    ((= bit 1) (right-branch branch))
    (else (error "bad bit: CHOOSE-BRANCH" bit))))

;From the book - Sample tree and sample message
(define sample-tree (make-code-tree (make-leaf 'A 4)
                      (make-code-tree
                        (make-leaf 'B 2)
                        (make-code-tree
                          (make-leaf 'D 1)
                          (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;Decode the message
(decode sample-message sample-tree) ;Obtained: (a d a b b c a)
