(define (square-list-v3 items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) (cons (square (car things)) answer))))
	(iter items '()))

(define (square-list-v4 items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) (cons answer (square (car things))))))
	(iter items '()))

(define (square-list-v5 items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things) (append answer (cons (square (car things)) '())))))
	(iter items '()))

(square-list-v3 (list 1 2 3 4 5 6 7))
(square-list-v4 (list 1 2 3 4 5 6 7))
(square-list-v5 (list 1 2 3 4 5 6 7))
