(cf "prime")
(load "prime")
(define (nontrivial-square-root-check test m)
	(if (and (not (= test 1))(not (= test (- m 1))) (= (remainder (square test) m) 1))
		 0
		 (square test)))

(define (exp-mod base exp m)
	(cond	((= exp 0) 1)
			((even? exp) (remainder (nontrivial-square-root-check (exp-mod base (/ exp 2) m) m) m))
			(else (remainder (* base (exp-mod base (- exp 1) m)) m))))

(define (miller-rabin-prime n test)
	(cond ((= test  n) #t)
		((and (even? n) (> n 2)) #f) ;all even is not primes
		((= (exp-mod test (- n 1) n) 0) #f)
		(else (miller-rabin-prime n (+ test 1)))))

(define (miller-rabin-prime? n)
	(miller-rabin-prime n 1))

(define (test-miller-rabin test n)
	(if (< test n)
		(	(test-miller-rabin (+ test 1) n)
			(newline)
			(display test)
			(display (eq? (prime? test) (miller-rabin-prime? test))))
		(newline)))



