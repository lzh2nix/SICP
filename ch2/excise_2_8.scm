(define (lower-bound a)
	(car a))
(define (upper-bound a)
	(cdr a))
(define (make-interval a b)
	(cons a b))

;[a, b] + [c, d] = [a + c, b + d]
(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y)) 
						(+ (upper-bound x) (upper-bound y))))

;[a, b] x [c, d] = [min(ac, ad, bc, bd), max((ac, ad, bc, bd)]
(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
			(p2 (* (lower-bound x) (upper-bound y)))
			(p3 (* (upper-bound x) (lower-bound y)))
			(p4 (* (upper-bound x) (upper-bound y))))
		(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

;[a, b] ÷ [c, d] = [min(a/c, a/d, b/c ,b/c), max(a/c, a/d, b/c ,b/c)]
(define (div-interval x y)
	(let ((p1 (/ (lower-bound x) (lower-bound y)))
			(p2 (/ (lower-bound x) (upper-bound y)))
			(p3 (/ (upper-bound x) (lower-bound y)))
			(p4 (/ (upper-bound x) (upper-bound y))))
		(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
;[a, b] - [c, d] = [a - d, b - c]
(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y))
						(- (upper-bound x) (lower-bound y))))
(define range-1 (cons 1.5 3))
(define range-2 (cons 1 4.5))
(upper-bound range-1)
(lower-bound range-2)
(add-interval range-1 range-2)
(mul-interval range-1 range-2)
(div-interval range-1 range-2)
(sub-interval range-1 range-2)
