(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b))))

;sum(a,b) = f(a) + f(a+1) + f(a+2) + f(a+3)
(define (sum-term x) x)
(define (inc x) (+ x 1))
(define (cube x) (* x x x))
(define (sum term a next b)
	(define (sum-combiner x y) (+ x y))
	(accumulate sum-combiner 0 sum-term a inc b))

;factorial(b)=b*(b-1)*(b-2)*....1
;factorial(b) = b*factorial(b-1)
;factorial(b-1) = (b-1)*factorial(b-2)
;factorial(1)=1
(define (product-term x)x)
(define (product term a next b)
	(define (product-combiner x y) (* x y))
	(accumulate product-combiner 1 product-term a inc b))
