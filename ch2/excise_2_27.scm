(define (deep-reverse items)
	(cond ((null? items) items)
			((not (pair? items)) items)
			(else (append (deep-reverse (cdr items)) (cons (deep-reverse (car items)) '())))))

;test code:
(deep-reverse (list 1 2 3 4 5))
(deep-reverse (list (list 1 2 3) (list 4 5 6)))
(deep-reverse (list 1 2 (list 3 4) (list 5 6)))
(deep-reverse (list 1 2 (list 3 4) (list 5 (list 6))))
