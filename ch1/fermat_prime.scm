(define (even? n)
	(= (remainder n 2) 0))
;expmod(base, n, m) = base^n / m
;base^n = square(base^(n/2)) if n %2 = 0
;base^n = base*base^(n-1) if n % 2 = 0

(define (expmod base n m)
	(cond ((= n 0) 1)
		((even? n) (remainder (square (expmod base (/ n 2) m)) m))
		(else (remainder (* base (expmod base (- n 1) m)) m))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (random n)))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else false)))
