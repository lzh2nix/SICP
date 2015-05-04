(define (make-frame origin edge1 edge2)
   (list origin edge1 edge2))

(define (origin-frame frame)
   (car frame))

(define (edge1-frame frame)
   (cadr frame))

(define (edge2-frame frame)
   (caddr  frame))


(define (make-vect x y)
   (cons x y))

(define (xcor-vect v)
   (car v))

(define (ycor-vect v)
   (cdr v))

;(x1, y1) + (x2, y2) = (x1 + x2, y1 + y2)
(define (add-vect v1 v2)
   (cons (+ (xcor-vect v1) (xcor-vect v2))
         (+ (ycor-vect v1) (ycor-vect v2))))

;(x1, y1) - (x2, y2) = (x1 - x2, y1 - y2)
(define (sub-vect v1 v2)
   (cons (- (xcor-vect v1) (xcor-vect v2))
         (- (ycor-vect v1) (ycor-vect v2))))
;s * (x, y) = (sx, sy)
(define (scale-vect s v)
   (cons (* s (xcor-vect v))
         (* s (ycor-vect v))))
(define (make-segment start end)
   (list start end))
(define (start-segment segment)
   (car segment))
(define (end-segment segment)
   (cadr segment))


(define (frame-coord-map frame)
	(lambda (v)
		(add-vect (origin-frame frame)
			(add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
				(scale-vect (ycor-vect v) (edge2-frame frame))))))
;test
((frame-coord-map (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1))) (make-vect 1 1))
((frame-coord-map (make-frame (make-vect -1 1) (make-vect -1 2) (make-vect 0 1))) (make-vect 1 1))

(define (draw-line start end)
	(display start)
	(display "---------->")
	(display end)
	(newline))

(define (segment->painter segment-list)
	(lambda (frame) 
		(for-each
			(lambda (segment)
				(draw-line 
					((frame-coord-map frame) (start-segment segment))
					((frame-coord-map frame) (end-segment segment))))
		segment-list)))
(define frame1 (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))
(define frame2 (make-frame (make-vect -1 1) (make-vect 1 0) (make-vect 0 1)))
(define frame3 (make-frame (make-vect -1 1) (make-vect 1 1) (make-vect -1 1)))

;out line top:t low:l right:r left:l
(define out-line
	(let ((tl (make-vect 0 1))
			(tr (make-vect 1 1))
			(ll (make-vect 0 0))
			(lr (make-vect 1 0)))
		(segment->painter (list (make-segment ll tl)
										(make-segment tl tr)
										(make-segment tr lr)
										(make-segment lr ll)))))
;test
(out-line frame1)
(out-line frame2)
(out-line frame3)

;diagonal line top:t low:l right:r left:l
(define diagonal-line
	 (let ((tl (make-vect 0 1))
         (tr (make-vect 1 1))
         (ll (make-vect 0 0))
         (lr (make-vect 1 0)))
      (segment->painter (list (make-segment ll tr)
                              (make-segment lr tl)))))
;test
(diagonal-line frame1)
(diagonal-line frame2)
(diagonal-line frame3)

;diamond
(define diamond-line
	(let ((top-middle (make-vect 0.5 1))
         (left-middle (make-vect 0 0.5))
         (bottom-middle (make-vect 0.5 0))
         (right-middle (make-vect 1 0.5)))
      (segment->painter (list (make-segment bottom-middle left-middle)
										(make-segment left-middle top-middle)
										(make-segment top-middle right-middle)
                              (make-segment right-middle bottom-middle)))))
;test
(diamond-line frame1)
(diamond-line frame2)
(diamond-line frame3)

