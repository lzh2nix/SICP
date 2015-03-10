(define (good-enough? guess x)
	(< (abs (- (improve guess x) guess)) 0.000001))

(define (average y x)
	(/ (+ x y) 2))

(define (improve guess x)
	(average guess (/ x guess)))

(define	(sqrt-iter guess x)
				(if (good-enough? guess x)
					guess
					(sqrt-iter (improve guess x) x)))

;
(define (sqrt x)
	(sqrt-iter 1.0 x))
