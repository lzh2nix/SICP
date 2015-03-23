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
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

;sqrt used fixed-point on y|->(y x/y)/2
(define (sqrt x) (fixed-point (lambda (y) (/ (+ y (/ x y)) 2.0)) 1.0))
