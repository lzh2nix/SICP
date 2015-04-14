(define (subset s)
	(if (null? s)
		(list '())
		(let ((rest (subset (cdr s))))
			(append rest (map (lambda (x) (cons (car s) x))rest)))))
