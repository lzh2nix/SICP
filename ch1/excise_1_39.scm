;tan(1) = x/1
;tan(2) = x/(1-x^2/3)
;tan(3) = x(1-x^2(3-x^2/5))
;tan(n) = x(1-x^2(3-x^2(5-.......)))

;N(i) = x if i = 1 else x^2
;D(i) = 1,3,5,7,9

(define (tan-cf x k)
	(define (Nx i) 
		(if (= i 1) 
			x
			(* x x)))

	(define (Dx n)
		(define (iter i result)
			(if (= i n)
				result
				(iter (+ 1 i) (+ result 2))))
		(iter 1 1))

	(define (iter i)
		(if (= i k)
			(/ (Nx i) (Dx i))
			(/ (Nx i) (- (Dx i) (iter (+ i 1))))))
	(iter 1))

