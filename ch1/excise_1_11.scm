(define (f_recurise n)
	(if (< n 3) 
		n
		(+ (f_recurise (- n 1)) 
			(* 2 (f_recurise (- n 2))) 
			(* 3 (f_recurise (- n 3))))))

(define (f_iter n)
	(define (f_iterator a b c n)
		(if (= n 0) 
			c
			(f_iterator b c (+ a (* 2 b) (* 3 c)) (- n 1))))
	
	(f_iterator 2 1 0 n))
