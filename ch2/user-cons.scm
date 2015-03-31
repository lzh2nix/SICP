(define (cons x y)
	(define (dispatch m)
		(cond ((= 0 m) x)
				((= 1 m) y)
				(else (error "Argument not o or 1 -----CONS" m))))

dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))
