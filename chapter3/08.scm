(define f
  (let ((called #f))
    (lambda (n)
      (if called
        n
        (begin (set! called #t) 0)
        )
      )
    )
  )


;Testing
(+ (f 0) (f 1)); 0
(+ (f 1) (f 0)); 1
