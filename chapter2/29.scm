(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;Part A
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

;Part B
(define (branch-weight branch)
  (cond
    ((null? branch) 0)
    ((not (pair? branch)) branch)
    (else (total-weight branch))
    )
  )
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile)))
  )
(define mob (make-mobile 1 (make-mobile 4 0)))
(total-weight mob);5

