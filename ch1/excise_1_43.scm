;If f is a numerical function and n is a positive integer, 
;then we can form the nth repeated application of f, 
;which is defined to be the function whose value at x is f(f(...(f(x))...)).
(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n) 
	(if (= 1 n) 
		(lambda (x)(f x)) 
		(compose f (repeated f (- n 1)))))

((repeated square 2) 5)

((repeated (lambda (x) (+ 1 x)) 10) 0)

(lambda (x) (square (square x)))


