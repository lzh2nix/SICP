;recurive version of fibonacci number
(define (fibonacci n)
	(cond ((= n 0) 0)
			((= n 1) 1)
			(else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))
)
;iteator version of fibonacci number
(define (fibonacci_iter n)
	(define (fibonacci_iterator a b count)
		(if (= count 0)
				b
				(fibonacci_iterator a (+ a b) (- count 1))))
	(fibonacci_iterator 1 0 n))
