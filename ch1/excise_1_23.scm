;prime?(n) = n %[2 sqrt(n)] != 0
(define (smallest-divisor? n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		((divides? n test-divisor) test-divisor)
		(else (find-divisor n (next test-divisor)))))

(define (divides? n m)
	(= (remainder n m) 0))

(define (prime? n)
	(= (smallest-divisor? n) n))
;if n can't divided by 2 we don't check any odd anymore
(define (next n)
	(cond ((= n 2) 3)
		(else (+ n 2))))
