(define (get-all-evens items)
	(define (iter result last)
		(if (null? last)
			result
			(if (even? (car last))
				(iter (append result (cons (car last) '())) (cdr last))
				(iter result (cdr last)))))
	(iter '() items))

(define (get-all-odds items)
	(define (iter result last)
		(if (null? last)
			result
			(if (odd? (car last))
				(iter (append result (cons (car last) '())) (cdr last))
				(iter result (cdr last)))))
	(iter '() items))

(define (same-parity . items)
	(let ((first (car items)))
		(if (even? first)
			(get-all-evens items)
			(get-all-odds items))))

(get-all-odds (list 1 2 3 4 5 6 7))	
(get-all-evens (list 1 2 3 4 5 6 7))
(same-parity 1 2 3 4 5 6 7 8 9 10)
(same-parity 2 3 4  5 6 7 8 9 10)

(define (f . z)
	(display z))	
