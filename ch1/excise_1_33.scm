(cf "prime")
(load "prime")
(define (filter-accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (filter-accumulate combiner null-value term (next a) next b))))

;sum-of-primes(a,b) = all sum of primes [a,b]
(define (sum-term x) x)
(define (inc x) (+ x 1))
(define (cube x) (* x x x))
(define (sum term a next b)
	(define (sum-combiner x y) 
		(if (prime? x)
			(+ x y)
			y))
	(filter-accumulate sum-combiner 0 sum-term a inc b))
;
(define (product-term x)x)
(define (product term a next b)
	(define (product-combiner x y) 
		(if (=(gcd x b) 1)
			(* x y)
			y))
	(filter-accumulate product-combiner 1 product-term a inc b))