
(define (cc amount coin-values)
	(cond ((= amount 0) 1)
			((or (< amount 0) (no-more? coin-values)) 0)
			(else 
				(+ (cc amount (except-first-denomination coin-values))
					(cc (- amount (first-denomination coin-values)) coin-values)))))
(define (no-more? items)
	(<= (length items) 0))

(define (except-first-denomination items)
	(cdr items))

(define (first-denomination items)
	(car items))

(define us-coins (list 5 1 50 25 10))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define cn-coins (list 100 50 20 10 5 2 1 0.5 0.2 0.1 0.05 0.02 0.01))
