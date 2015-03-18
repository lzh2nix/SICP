
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

;survey time of calculate is it a prime number
(define (time-prime-test n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (prime? n) 
		(report-time n (- (runtime) start-time))))
(define (report-time prime elapsed-time)
	(newline)
	(display prime)
	(display " *** ")
	(display elapsed-time))

;search primes number in [m n]
(define (search-for-primes m n)
	(if (or (< m n)(= m n))
		(test-m m n)
		))

(define (test-m m n)
	(time-prime-test m) 
	(search-for-primes (+ m 1) n))
