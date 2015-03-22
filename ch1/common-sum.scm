(define (sum term a next b)
	(if (> a b)
		0
		(+	(term a)
			(sum term (next a) next b))))

;sum-of-cubes(a b) = a^3 + (a+1)^3 +..... + b^3
(define (inc a) (+ a 1))
(define (cube a) (* a a a))
(define (sum-of-cubes a b)
	(sum cube a inc b))

;sum-of-integers(a b) = a + (a+1) + ..... + b
(define (inter a) a)
(define (sum-of-integers a b)
	(sum inter a inc b)) 

;sum-of-pi = 1/1*3 + 1/5*7 + 1/9*11
(define (pi-term x)
	(/ 1.0 (* x (+ x 2))))

(define (next-pi-term x)
	(+ x 4))
(define (sum-pi a b)
	(sum pi-term a next-pi-term b))

;f(a,b) = [f(a+dx/2) + f(a+dx+dx/2) + f(a+2dx+dx/2)+ ....]dx
(define (integral f a b dx)
	(define (add-dx x) (+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b) dx))


