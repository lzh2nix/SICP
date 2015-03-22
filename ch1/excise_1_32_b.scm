(define (accumulate combiner null-value term a next b)
	(define (iter a result)
		(if (> a b) 
			result
			(iter (next a) (combiner (term a) result))))
	(iter a null-value))

;sum(a,b) = f(a) + f(a+1) + f(a+2) + f(a+3)
(define (sum-term x) x)
(define (inc x) (+ x 1))
(define (cube x) (* x x x))
(define (sum term a next b)
	(define (sum-combiner x y) (+ x y))
	(accumulate sum-combiner a sum-term a inc b))

;factorial(b)=1*2*3*4*.....*b
(define (product-term x)x)
(define (product term a next b)
	(define (product-combiner x y) (* x y))
	(accumulate product-combiner 1 product-term a inc b))
