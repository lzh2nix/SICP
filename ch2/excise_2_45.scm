(define (split op1 op2)
	(lambda (painter n)
		(if (= n 0)
			painter
			(let ((smaller ((split op1 op2) painter (- n 1))))
				(op1 painter (op2 smaller smaller))))))

(define rignt-split (split beside below))
(define up-split (split beside below))
