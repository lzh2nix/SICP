;f(a b) = f(a)*f(a+1)*f(a+2)*...*f(b)
(define (product f a next b)
	(if (> a b)
		1
		(* (f a) (product f (next a) next b) 1.0)))

(define (fact n) n)
(define (next-iter n) (+ n 1))

(define (factorial b)
	(product fact 1 next-iter b))

(define (f n)
	(if (even? n) 
		(/ (+ n 2) (+ n 3))
		(/ (+ n 3) (+ n 2))))

(define john-wallis-pi (product f 0 next-iter 10000))

