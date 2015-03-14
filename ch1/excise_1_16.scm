
(define (even? n)
	(= (remainder n 2) 0))

;a^n = (a^2)^(n / 2) if n % 2 = 0
;a^n = a * (a^2)^(n / 2) if n % 2 = 1
(define (expt-fast-iter a n)
	(define (expt-fast-iterator a n product)
		(cond ((= n 0) product)
				((even? n) (expt-fast-iterator (* a a) (/ n 2) (* a a)))
				(else (* a (expt-fast-iterator a (- n 1) 1)))))
	(expt-fast-iterator a n 1))
