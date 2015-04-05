(define (low-bound a)
	(car a))

(define (upper-bound a)
	(cdr a))

(define (make-interval a b)
	(cons a b))

;[a, b] x [c, d] = [min(ac, ad, bc, bd), max((ac, ad, bc, bd)]
(define (mul-interval x y)
   (let ((p1 (* (lower-bound x) (lower-bound y)))
         (p2 (* (lower-bound x) (upper-bound y)))
         (p3 (* (upper-bound x) (lower-bound y)))
         (p4 (* (upper-bound x) (upper-bound y))))
      (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
	
;[a, b] + [c, d] = [a + c, b + d]
(define (add-interval x y)
   (make-interval (+ (lower-bound x) (lower-bound y))
                  (+ (upper-bound x) (upper-bound y))))

(define (div-interval x y)
   (let ((p1 (/ (lower-bound x) (lower-bound y)))
         (p2 (/ (lower-bound x) (upper-bound y)))
         (p3 (/ (upper-bound x) (lower-bound y)))
         (p4 (/ (upper-bound x) (upper-bound y))))
      (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (par1 r1 r2)
	(div-interval (mul-interval r1 r2) (add-interval r1 r2)))

(define (par2 r1 r2)
	(let ((one (make-interval 1 1)))
	(div-interval one  
					  (add-interval (div-interval one r1) (div-interval one r2)))))
(par1 (make-interval 1.011 1.11) (make-interval 2.00003 2.00009))
(par2 (make-interval 1.011 1.11) (make-interval 2.00003 2.00009))
