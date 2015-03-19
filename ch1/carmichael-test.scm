(load "prime")
(define (expmod base n m)
   (cond ((= n 0) 1)
      ((even? n) (remainder (square (expmod base (/ n 2) m)) m))
      (else (remainder (* base (expmod base (- n 1) m)) m))))

(define (carmichael-test n)
	(carmichael-test-iter 1 n))

(define (carmichael-test-iter test n)
	(cond ((and (= test n) (eq? #f (prime? n))) #t)
		((= (expmod test n n) test) (carmichael-test-iter (+ test 1) n))
		(else #f)))
(define (search-for-carmichael m n)
	(if (< m n)
		(check-carmichael m n)))

(define (check-carmichael test high)
	(if (carmichael-test test)
		(report-carmichael test))
	(search-for-carmichael (+ test 1) high))

(define (report-carmichael carmichael)
	(newline)
	(display " *** ")
	(display carmichael))

