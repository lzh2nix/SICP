(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.0001))

(define (average y x)
	(/ (+ x y) 2))

(define (improve guess x)
	(average guess (/ x guess)))

(define	(sqrt-iter guess x)
				(if (good-enough? guess x)
					guess
					(sqrt-iter (improve guess x) x)))
