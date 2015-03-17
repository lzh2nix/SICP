;prime?(n) = n %[2 sqrt(n)] != 0
(define (smallest-divisor? n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		((divides? n test-divisor) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? n m)
	(= (remainder n m) 0))

(define (prime? n)
	(= (smallest-divisor? n) n))
