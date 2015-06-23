(define (make-from-real-image x y)
	(define (dispatch op)
		(cond ((eq? op 'real-part) x)
				((eq? op 'image-part) y)
				((eq? op 'magnitude) (sqrt (+ (square x) (square y))))
				((eq? op 'angle) (atan y x))
				(else
					(error "Unknow op -----MAKE-FROM-REAL-IMAG" op))))
	dispatch)


(define (make-from-mag-ang r a)
	(define (dispatch op)
		(cond ((eq? op 'magnitude) r)
				((eq? op 'angle) a)
				((eq? op 'real-part) (* r (cos a)))
				((eq? op 'image-part) (* r (sin a)))
				(else
					(error "Unknow op -----MAKE-FROM-REAL-IMAG" op))))
	dispatch)


(define (apply-generic arg op) (arg op))
(apply-generic (make-from-real-image 1 1) 'magnitude)
(apply-generic (make-from-real-image 1 1) 'angle)

(apply-generic (make-from-mag-ang (sqrt 2) .7853981633974483) 'real-part)
(apply-generic (make-from-mag-ang (sqrt 2) .7853981633974483) 'image-part)
