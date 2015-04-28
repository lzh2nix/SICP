(define (make-vect x y)
	(cons  x y))

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

;test code
(make-vect 1 2)
(xcor-vect (cons 1 2))
(ycor-vect (cons 1 2))

(add-vect (make-vect 1 2) (make-vect 1 2))
(sub-vect (make-vect 1 2) (make-vect 1 2))
(scale-vect 10 (make-vect 1 2))

