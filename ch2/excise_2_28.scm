(define (fringe items)
	(cond ((null? items) items)
			((not (pair? items)) (cons items '()))
			(else (append (fringe (car items)) (fringe (cdr items))))))

;test code
(fringe (list 1 2 3 4 5))
(fringe (list (list 1 2) (list 3 4)))
(fringe (list (list (list 1 2) (list 3 4)) (list (list 1 2) (list 3 4))))
