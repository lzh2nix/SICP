;
(define (count-leaves t)
	(accumulate (lambda (x y) (if (not (pair? x))
											(+ 1 y)
											(+ (count-leaves x) y)))
					0
					t))
