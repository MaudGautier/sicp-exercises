(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;Selects operator `+` or `-` depending on value of b