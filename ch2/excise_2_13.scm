(define (low-bound a)
	(car a))

(define (upper-bound a)
	(cdr a))

(define (make-interval a b)
	(cons a b))

(define (make-center-percent center percentage)
	(make-interval 
		(- center percentage) 
		(+ center percentage)))

(define (center i)
	(/ (+ (low-bound i) (upper-bound i)) 2))

(define (percent i)
	(/ (* (/ (- (upper-bound i) (low-bound i)) 2) 100) 100))

;[a, b] x [c, d] = [min(ac, ad, bc, bd), max((ac, ad, bc, bd)]
(define (mul-interval x y)
   (let ((p1 (* (lower-bound x) (lower-bound y)))
         (p2 (* (lower-bound x) (upper-bound y)))
         (p3 (* (upper-bound x) (lower-bound y)))
         (p4 (* (upper-bound x) (upper-bound y))))
      (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
	
(define range-a (make-center-percent 10 (/ 1 100)))
(define range-b (make-center-percent 100 (/ 1 100)))

;range-a*range-b =[(a-Δx)(c-Δy), (a+Δx)(b+Δy)] 
;percent(range-a, range-b) = ((a+Δx)(b+Δy) - (a-Δx)(c-Δy))/2
;=aΔy + bΔx
(center (mul-interval range-a range-b))
(percent (mul-interval range-a range-b))
