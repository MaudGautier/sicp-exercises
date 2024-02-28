(define (accumulate proc initial sequence)
   (if (null? sequence)
       initial
       (proc (car sequence)
             (accumulate proc initial (cdr sequence)))))


;map
(define nil '())
(define (map proc sequence)
  (accumulate (lambda (first accumulator) (cons (proc first) accumulator))
    nil
    sequence))

(map square (list 1 2 3 4));(1 4 9 16)

;append
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2) (list 3 4));(1 2 3 4)


;length
(define (length sequence)
  (accumulate (lambda (first x)
                (+ 1 x))
    0
    sequence))

(length (list 1 2 3 4));4
