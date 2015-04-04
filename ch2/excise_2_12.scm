(define (low-bound a)
	(car a))

(define (upper-bound a)
	(cdr a))

(define (make-interval a b)
	(cons a b))

(define (make-center-percent center percentage)
	(make-interval 
		(- center percentage) 
		(+ center percentage)))

(define (center i)
	(/ (+ (low-bound i) (upper-bound i)) 2))

(define (percent i)
	(/ (* (/ (- (upper-bound i) (low-bound i)) 2) 100) 100))

(define range-a (make-center-percent 10 (/ 0.002 100)))
(define range-b (make-center-percent 100 (/ 0.002 100)))
(center range)
(percent range)
