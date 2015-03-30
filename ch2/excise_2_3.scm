;export from excise 2.2 
(define (make-segment a b) (cons a b))
(define (start-segment a) (car a))
(define (end-segment a) (cdr a))

(define (make-point x y) (cons x y))
(define (x-point a) (car a))
(define (y-point a) (cdr a))

(define (print-point a)
	(newline)
	(display "(")
	(display (x-point a))
	(display ",")
	(display (y-point a))
	(display ")"))


;rectangle
;
;       a(x1,y1)  
;        *-------------------------*
;        |   	                    |
;        |                         | 
;        |	                       |
;        |		                    |
;        |		   				     |
;			|			                 | 
;        *-------------------------*
;                                 b(x2,y2) 
;we can specify a rectangle by it's diagonal(start point and end point) 
(define make-rect make-segment) 

;perimeter of rectangle = 2(abs(x1 - x2) + abs(y1 - y2))
(define (perimeter-rectangle rectangle-a)
	(let ((x1 (x-point (start-segment rectangle-a)))
			(y1 (y-point (start-segment rectangle-a)))
			(x2 (x-point (end-segment rectangle-a)))
			(y2 (y-point (end-segment rectangle-a))))
		(* (+ (abs (- x1 x2)) (abs (- y1 y2))) 2)))

;Area of rectangle-a = abs(x1 - x2) * abs(y1 - y2)
(define (area-rectangle rectangle-a)
	(let ((x1 (x-point (start-segment rectangle-a)))
			(y1 (y-point (start-segment rectangle-a)))
			(x2 (x-point (end-segment rectangle-a)))
			(y2 (y-point (end-segment rectangle-a))))
		(* (abs (- x1 x2)) (abs (- y1 y2)))))
(define x1 0)
(define y1 2)
(define x2 5)
(define y2 (- 1))
(define point-a (make-point x1 y1))
(define point-b (make-point x2 y2))
(define rectangle-a (make-segment point-a point-b))


