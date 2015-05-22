(cf "excise_2_49.scm")
(load "excise_2_49.scm")

(define (transform-painter painter origin corner1 corner2)
	(lambda (frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
				(painter
					(make-frame new-origin
						(sub-vect (m corner1) new-origin)
						(sub-vect (m corner2) new-origin)))))))

;------------*
;          * | 
;			*	 |
;		*		 |
;			*	 |
;			  * |	
;------------*
(define painter
	(let ((middle (make-vect 0.5 0.5))
			(right-bottom (make-vect 1.0 0.0))
			(left-top (make-vect 0.0 1.0))
			(right-top (make-vect 1.0 1.0)))
		(segment->painter (list (make-segment right-top middle)
										(make-segment middle right-bottom)))))
(define (beside painter1 painter2)
	(let ((split-point (make-vect 0.5 0.0)))
		(let ((painter-left 
					(transform-painter painter1 
											 (make-vect 0.0 0.0)
											 split-point
											 (make-vect 0.0 1.0)))
			   (painter-right
				 	(transform-painter painter2
										 split-point
										 (make-vect 1.0 0.0)
										 (make-vect 0.5 1.0))))
	(lambda (frame)
		(painter-left frame)
		(painter-right frame)))))

(define (below painter1 painter2)
	(let ((split-point (make-vect 0.0 0.5)))
		(let ((painter-up
					(transform-painter painter1
						split-point
						(make-vect 1.0 0.5)
						(make-vect 0.0 1.0)))
				(painter-down
					(transform-painter painter2
						(make-vect 0.0 0.0)
						(make-vect 1.0 0.0)
						split-point)))
	(lambda (frame)
		(painter-up frame)
		(painter-down frame)))))
;test code
(painter frame1)
((beside  painter painter )frame1)
((below  painter painter )frame1)
