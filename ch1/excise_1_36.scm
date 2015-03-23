(define tolerance 0.00001)
;find fixed-point where f(x) = x
;guess and applying f repeatedly 
; f(x),f(f(x)), f(f(f(x))),....
;until the value does not change very much
(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(newline)
			(display guess)
			(display "*****")
			(display next)
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

;sqrt used fixed-point on y|->log(1000)/log(y)
(define root-x (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)) 
