(define (make-segment a b) (cons a b))
(define (start-segment a) (car a))
(define (end-segment a) (cdr a))

(define (make-point x y) (cons x y))
(define (x-point a) (car a))
(define (y-point a) (cdr a))

;midle-point of (x1,y1)-------------(x2,y2)=((x1 + x2)/2 , (y1 + y2)/2)
;where (x1,y1) is start point, (x2,y2) is end point
(define (midle-point-segment segment-a)
	(let ((x1 (x-point (start-segment segment-a)))
			(y1 (y-point (start-segment segment-a)))
			(x2 (x-point (end-segment segment-a)))
			(y2 (y-point (end-segment segment-a))))
		(make-point (/ (+ x1 x2) 2.0) (/ (+ y1 y2) 2.0))))

(define (print-point a)
	(newline)
	(display "(")
	(display (x-point a))
	(display ",")
	(display (y-point a))
	(display ")"))

(define point-a (make-point x1 y1))
(define point-b (make-point x2 y2))
(define segment-a (make-segment point-a point-b))

