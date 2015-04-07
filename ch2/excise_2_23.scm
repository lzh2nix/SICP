(define (for-each proc items)
	(define (iter things item)
		(proc item)
		(if (null? things)
			(newline)
			(iter (cdr things) (car things))))
	(iter (cdr items) (car items)))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4 5 6 7))
