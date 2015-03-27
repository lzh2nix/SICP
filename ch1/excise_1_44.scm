;smoothing If f is a function and dx is some small number, 
;then the smoothed version of f is the function whose 
;value at a point x is the average of f(x - dx), f(x), and f(x + dx)
(define dx 0.0001)

(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n) 
	(if (= 1 n) 
		(lambda (x)(f x)) 
		(compose f (repeated f (- n 1)))))

(define (smoothing f) (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
((repeated (smoothing square) 1) 2)
((smoothing (smoothing square)) 2)
