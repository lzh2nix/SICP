(define (right-split painter n)
	(if (= 0 n)
		painter
		(let ((smaller (right-split painter (- n 1))))
			(beside painter (below smaller smaller)))))
(define (up-split painter n)
	(if (= n 0)
		painter
		(let (smaller (up-split painter (- n 1)))
			(below painter (beside smaller smaller)))))

(define (corner-split painter n)
	(if (= 0 n)
		painter
		(let ((up (up-split painter (- n 1)))
				(right (right-split painter (- n 1)))
				(top-left (beside up up)))
		(let ((bottom-right (below right right))
				(corner (corner-split painter (- n 1))))
			(beside (below painter top-left)
						(below bottom-right corner))))))

(define play 
	(let ((x (+ 1 1)) 
			(y (+ 2 2)))
	(let ((z (+ x y)))
		(+ z 1))))	
