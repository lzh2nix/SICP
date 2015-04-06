; before '() is the last pair 
(define (last-pair items)
	(let ((cur (car items))
			(last (cdr items)))
		(if (null? last)
			cur
			(last-pair last))))
