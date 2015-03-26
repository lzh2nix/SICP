(cf "fix-point")
(load "fix-point")
(define dx 0.00001)
(define (cube x) (* x x))
(define (deriv g)
	(lambda (x) 
		(/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
	(lambda (x)
		(- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
	(fixed-point (newton-transform g) guess))

(define (sqrt x) (newton-method (lambda (y) (- (square y) x)) 1.0))
(define (cube-root x) (newton-method (lambda (y) (- (cube y) x)) 1.0))
(define (cubic a b c) (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

