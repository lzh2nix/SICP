;[a, b] x [c, d] = [min(ac, ad, bc, bd), max((ac, ad, bc, bd)]
(define (lower-bound a)
   (car a))

(define (upper-bound a)
   (cdr a))

(define (make-interval a b)
   (cons a b))

(define (make-center-percent center p)
   (let ((width (* center p)))
   (make-interval
      (- center width)
      (+ center width))))

(define (center i)
   (/ (+ (low-bound i) (upper-bound i)) 2))

(define (width i)
   (/ (- (upper-bound i) (low-bound i)) 2))

(define (percent-tolerance i)
   (/ (width i) (center i)))

(define (mul-interval x y)
   (let ((p1 (* (lower-bound x) (lower-bound y)))
         (p2 (* (lower-bound x) (upper-bound y)))
         (p3 (* (upper-bound x) (lower-bound y)))
         (p4 (* (upper-bound x) (upper-bound y))))
      (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
	
(define range-a (make-center-percent 10 0.3))
(define range-b (make-center-percent 100 0.2))

;range-a*range-b =[(a-aΔx)(b-bΔy), (a+aΔx)(b+bΔy)] 
;=Δy + Δx
(center (mul-interval range-a range-b))
(percent-tolerance (mul-interval range-a range-b))
