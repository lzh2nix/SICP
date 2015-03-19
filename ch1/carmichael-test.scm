(define (expmod base n m)
   (cond ((= n 0) 1)
      ((even? n) (remainder (square (expmod base (/ n 2) m)) m))
      (else (remainder (* base (expmod base (- n 1) m)) m))))

(define (carmichael-test n)
	(carmichael-test-iter 1 n))

(define (carmichael-test-iter test n)
	(cond ((= test n) #t)
		((= (expmod test n n) test) (carmichael-test-iter (+ test 1) n))
		(else #f)))

