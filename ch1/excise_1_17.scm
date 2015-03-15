;a * b = a + a + a + a 
;a * b = ((a * b)/2)*2 if b % 2 = 0
;a * b = a + (a * (b -1))

 
(define (double n)
	(* n 2))

(define (halve n)
	(= (remainder n 2) 0))

(define (fast-product a b)
	(cond ((or (= a 0) (= b 0)) 0)
			((= b 1) a)
			((halve b) (double (fast-product a (/ b 2))))
			(else (+ (fast-product a (- b 1)) a))))
