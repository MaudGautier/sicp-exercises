(load "chapter2/67")
(load "chapter2/68")

;From the book - adjoin set
(define (adjoin-set x set)
  (cond ((null? set) (list x))
    ((< (weight x) (weight (car set))) (cons x set))
    (else (cons (car set)
            (adjoin-set x (cdr set))))))

;From the book - make leaf-set
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

;Write generate-huffman-tree
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (cond
    ((null? (cdr leaves)) (car leaves))
    (else
      (let (
             (first-merged-pair (make-code-tree (car leaves) (cadr leaves)))
             (rest-leaves (cddr leaves))
             )
        (successive-merge (adjoin-set first-merged-pair rest-leaves))
        )
      )
    ))

;Testing
(define sample-huffman-tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
sample-huffman-tree ; Obtained: ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)
(decode (encode '(a d a b b c a) sample-huffman-tree) sample-huffman-tree) ; Expected: '(a d a b b c a)
