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

(define (flip-vert painter)
	(transform-painter painter
							 (make-vect 0.0 1.0)
							 (make-vect 1.0 1.0)
							 (make-vect 0.0 0.0)))
;------------*
;*         * | 
;	*		*	 |
;		*		 |
;				 |
;			    |	
;-------------
(define painter
	(let ((middle (make-vect 0.5 0.5))
			(right-bottom (make-vect 1.0 0.0))
			(left-top (make-vect 0.0 1.0))
			(right-top (make-vect 1.0 1.0)))
		(segment->painter (list (make-segment right-top middle)
										(make-segment middle left-top)))))

(define (shrink-to-upper-right painter)
	(transform-painter painter
							 (make-vect 0.5 0.5)
							 (make-vect 1.0 0.5)
							 (make-vect 0.5 1.0)))

(define (rotate90 painter)
	(transform-painter painter
							 (make-vect 1.0 0.0)
							 (make-vect 1.0 1.0)
							 (make-vect 0.0 0.0)))
;test code
(painter frame1)
((flip-vert painter) frame1)
((shrink-to-upper-right painter) frame1)
((rotate90 painter) frame1)
