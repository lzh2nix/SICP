;	a0 + a1x + a2x^2 + a3x^3 + a4x^4
;	= a0 + x(a1 + x(a2 + x(a3 + xa4)))
(define (horner-eval x coefficient-sequence)
	(accumulate (lambda (this-coeff higner-terms) (+ this-coeff (* x higner-terms)))
					0
					coefficient-sequence))
