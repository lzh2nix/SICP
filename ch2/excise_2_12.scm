(define (low-bound a)
	(car a))

(define (upper-bound a)
	(cdr a))

(define (make-interval a b)
	(cons a b))

(define (make-center-percent center p)
	(let ((width (* center p)))
	(make-interval 
		(- center width) 
		(+ center width))))

(define (center i)
	(/ (+ (low-bound i) (upper-bound i)) 2))

(define (width i)
	(/ (- (upper-bound i) (low-bound i)) 2))

(define (percent-tolerance i)
	(/ (width i) (center i)))

(define range-a (make-center-percent 10 0.3))
(define range-b (make-center-percent 100 0.2))
(center range-a)
(percent-tolerance range-a)
