(define (low-bound a)
	(car a))

(define (upper-bound a)
	(cdr a))

(define (make-interval a b)
	(cons a b))
;
;
;-------------------0----------------------->
;    |    |      |     |   |     | 
;   a1    b1    a2     b2  a3   b3
;
(define (sign a)
	(cond ((<= (upper-bound a) 0) 1)
			((>= (low-bound a) 0) -1))
			(else 0))
;[a, b] × [c, d] = [min(ac, ad, bc ,bd), max(ac, ad, bc ,bd)]
(define (mul-interval x y)
	(let ((a (low-bound x))
			(b (upper-bound x))
			(c (low-bound y))
			(d (upper-bound y)))
	(cond ((= (sign a) 1)
				(cond ((= (sign b) 1) (make-interval (* a c) (* b d)))
						((= (sign b) 0) (make-interval (* c d) (* b d)))
						(else (make-interval (* c b) (* a d)))))
			((= (sign a) 0)
				(cond ((= (sign b) 1) (make-interval (* a d) (* b d)))
						((= (sign b) 0) (make-interval (min (* a d) (* b c)) (max (* a c) (*b d))))
						(else (make-interval (* b c) (* a c)))))
			((= (sign a ) -1)
				(cond ((= (sign b) 1) (make-interval (* b d) (* a d)))
						((= (sign b) 0) (make-interval (* a d) (* a c)))
						(else (make-interval (* a c) (* b c))))))))
