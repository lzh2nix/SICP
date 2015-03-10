
; if y is approximate cube root of x, the (x/y^2 + 2*y)/3 is better than y
(define (good-enough? guess x)
	(< (abs (- guess (improve guess x))) 0.00001))

(define (improve guess x)
	(/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-root-iter guess x)
	(if (good-enough? guess x)
		guess
		(cube-root-iter (improve guess x) x)))

(define (cube-root x)
	(cube-root-iter 1.0 x))
