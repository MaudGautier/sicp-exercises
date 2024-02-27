(define lst1 '(1 3 (5 7) 9))
(define lst2 '((7)))
(define lst3 '(1 (2 (3 (4 (5 (6 7)))))))

(cdr (cdr (cdr lst1)));7
(car (car lst2));7
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr lst3))))))))))));7