(define get 2d-get)
(define put 2d-put!)

(define (attach-tag type-tag contents)
	(cons type-tag contents))
(define (type-tag datum)
	(if (pair? datum)
		(car datum)
		(error "Bad tag type" datum)))
(define (contents datum)
	(if (pair? datum)
		(cdr datum)
		(error "Bad tag type" datum)))

(define (rectangular? z)
	(eq? (type-tag z) 'rectangular))
(define (polar? z)
	(eq? (type-tag z) 'polar))

(define (install-rectangular-package)
;;internal procedures
(define (real-part z) (car z))
(define (image-part z) (cdr z))
(define (make-from-real-imag x y) (cons x y))
(define (magnitude z)
	(sqrt (+ (square (real-part z)) (square (image-part z)))))
(define (angle z)
	(atan (image-part z) (real-part z)))
(define (make-from-mag-ang r a)
	(cons (* r (cos a)) (* r (sin a))))

;;interface to the rest of system
(define (tag x) (attach-tag 'rectangular x))
(put 'real-part '(rectangular) real-part)
(put 'image-part '(rectangular) image-part)
(put 'magnitude '(rectangular) magnitude)
(put 'angle '(rectangular) angle)
(put 'make-from-real-imag 'rectangular (lambda (x y) (tag (make-from-real-imag x y))))
(put 'make-from-mag-ang 'rectangular (lambda (r a) (tag (make-from-mag-ang r a))))

'done)
(define (install-polar-package)
;;internal procedures
(define (magnitude z) (car z))
(define (angle z) (cdr z))
(define (make-from-mag-ang r a) (cons r a))
(define (real-part z) (* (magnitude z) (cos (angle z))))
(define (image-part z) (* (magnitude z) (sin (angle z))))
(define (make-from-real-imag x y)
	(cons (sqrt (+ (square x) (square y))) (atan y x)))
;;interface to the rest of system
(define (tag x) (attach-tag 'polar x))
(put 'real-part 'polar real-part)
(put 'image-part 'polar image-part)
(put 'magnitude 'polar magnitude)
(put 'angle 'polar angle)
(put 'make-from-mag-ang 'polar 
	(lambda (r a) (tag (make-from-mag-ang r a))))
(put 'make-from-real-imag 'polar 
	(lambda (x y) (tag (make-from-real-imag x y))))
'done)

(define (apply-generic op args)
	(let ((type-tags (type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(proc (contents args))
				(error
					"NO method for these types ----" (list args))))))

(define (real-part z) (apply-generic 'real-part z))
(define (image-part z) (apply-generic 'image-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(define (make-from-real-imag x y)
	((get 'make-from-real-imag 'rectangular) x y))
(define (make-from-mag-ang r a)
	((get 'make-from-mag-ang 'polar) r a))

(install-rectangular-package)
(install-polar-package)
(define (add-complex z1 z2)
	(make-from-real-imag (+ (real-part z1) (real-part z2))
								(+ (image-part z1) (image-part z2))))

(define (sub-complex z1 z2)
	(make-from-real-imag (- (real-part z1) (real-part z2))
								(- (image-part z1) (image-part z2))))

(define (mul-complex z1 z2)
	(make-from-real-imag (* (magnitude z1) (magnitude z2))
								(+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
	(make-from-real-imag (/ (magnitude z1) (magnitude z2))
								 (- (angle z1) (angle z2))))
(define r1 (make-from-real-imag 1 2))
(define r2 (make-from-mag-ang 3 4))
(add-complex r1 r2)
(sub-complex r1 r2)
(mul-complex r1 r2)
(div-complex r1 r2)
