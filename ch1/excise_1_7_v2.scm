
;
(define (sqrt x)
	(define (good-enough? guess)
		(< (abs (- (improve guess) guess)) 0.000001))
	(define (average y x)
		(/ (+ x y) 2))
	(define (improve guess)
		(average guess (/ x guess)))
	(define (sqrt-iter guess)
		(if (good-enough? guess)
			guess
			(sqrt-iter (improve guess))))
	(sqrt-iter 1.0))
