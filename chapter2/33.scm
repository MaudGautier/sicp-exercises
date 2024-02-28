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
