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
(define (flip-horiz painter)
	(transform-painter painter
							 (make-vect 1.0 0)
							 (make-vect 0.0 0.0)
							 (make-vect 1.0 1.0)))
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

;test code
(painter frame1)
((flip-horiz painter) frame1)
