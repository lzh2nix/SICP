;(cons a b) = 2^a * 3^b
(define (cons a b)
	(* (expt 2 a) (expt 3 b)))


;(car z) = 
(define (car z)
	(define (iter n a)
		(if (= (remainder n 2) 0) 
			(iter (/ n 2) (+ a 1))
			a))
	(iter z 0))

;(cdr z) =
(define (cdr z)
	(define (iter n b)
	(if (= (remainder n 3) 0)
		(iter (/ n 3) (+ b 1))
		b))
	(iter z 0))
