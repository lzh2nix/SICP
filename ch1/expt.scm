;a^n = a*a(n-1)
;a^(n-1) = a*a^(n-2)
(define (expt-recursive a n)
	(if (= n 0)
		1
		(* a (expt-recursive a (- n 1)))))


;a^n = 1*a^1*a^2*a^(n-1)*a^n
(define (expt-iter a n)
	(define (expt-iterator a n product)
		(if (= n 0)
			product
			(expt-iterator a (- n 1) (* a product))))
	(expt-iterator a n 1))

;fast expt
;	a^n = (a^(n/2))^2 if n %2 = 0
; 	a^n = a*a^(n-1) if n % = 1
(define (even? n)
	(= (remainder n 2) 0))
(define (expt-fast a n)
	(cond ((= n 0) 1)
			((even? n) (square (expt-fast a (/ n 2))))
			(else (* a (expt-fast a (- n 1))))))	
