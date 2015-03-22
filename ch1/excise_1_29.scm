;simson-integral(f a b) = h[y(0) +4y(1) + 2y(0) +....+ 2y(n-2) + 4 (n-1) + y(n)]
;where h = (b-a)/n
;y(n) = f(a+nh)
(define(sum term a next b)
   (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))
		))
(define (cube a) (* a a a))
(define (simson-integral f a b n)
	(define get-h (/ (- b a) (* n 1.0)))
	(define (simson-term x)
		(define y (f (+ a (* x get-h))))
		(cond ((or (= x 0) (= x n)) y)
				((even? x) (* 2 y))
				(else (* 4 y))))
	(define (next-iter n) (+ n 1))
	(* (sum simson-term a next-iter n) (/ get-h 3.0)))

