(define (accumulate proc initial sequence)
   (if (null? sequence)
       initial
       (proc (car sequence)
             (accumulate proc initial (cdr sequence)))))

(define nil '())
(define (map proc sequence)
  (accumulate (lambda (first accumulator) (cons (proc first) accumulator))
    nil
    sequence))

(map square (list 1 2 3 4));(1 4 9 16)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2) (list 3 4));(1 2 3 4)



