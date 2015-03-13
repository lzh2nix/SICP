(define (f_recurise n)
	(if (< n 3) 
		n
		(+ (f_recurise (- n 1)) 
			(* 2 (f_recurise (- n 2))) 
			(* 3 (f_recurise (- n 3))))))

(define (f_iter n)
	(if (< n 3)
		n
	(f_iterator 0 1 2 n)))

(define (f_iterator a b c n)
	(if (< n 3) 
		c
		(f_iterator b c (+ c (* 2 b) (* 3 a)) (- n 1))))
