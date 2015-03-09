!/usr/bin/mit-scheme
;add a sequence number
(define add
(+	(*	3
		(+	(*	2	4)
			(+ 3 	5)))
	(+	(-	10	7)
		6)))

;squre of N
(define (squre x) (*	x	x))

;sum of squre
(define	(sum-of-squre x y)
				(+	(squre x)
					(squre y)))
;abstract of x
(define (abs x)
	(cond	((> x	0)	x)
			((= x 0) 0)
			((< x 0) (- x))))

(define (abs_v1 x)
	(cond ((< x 0) (- x))
			(else x)))

(define (abs_v2 x)
	(if (< x 0) (- x) x))
