(define (sum-of-n sum n)
	(if (= n 0)
		sum
		(sum-of-n (+ sum n) (- n 1))))

(define (get-x n)
	(- n (sum-of-n 0 (get-y n 1))))


(define (get-y n y)
	(if (< n y)
		 (- y 1)
		(get-y (- n y) (+ 1 y))))

(define (pascal-triangle-iter y x)
	(if (or (= x y) (= x 0)) 
		1
		(+ (pascal-triangle-iter (- y 1) (- x 1)) 
			(pascal-triangle-iter (- y 1) x))))

(define (pascal-triangle n)
	(pascal-triangle-iter (get-y n 1) (get-x n)))
