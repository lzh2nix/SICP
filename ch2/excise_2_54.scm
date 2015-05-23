(define (equal? a b)
	(if (not (pair? a))
			(eq? a b)
		(and 
			(equal? (car a) (car b))
			(equal? (cdr a) (cdr b)))))


;test
(equal? 1 2)
(equal? 1 1)
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '(this (is a) list) '(this (is a) list))
(equal? (list 1 2 3 4) (list 1 2 3 4))
(equal? (list 1 2 3 4) (list 1 2 3 4))
