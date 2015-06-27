(define (install-complex-package)
	;;internal interface
	(define (make-from-real-image x y)
		((get 'make-from-real-image 'rectangular) x y))
	(define (make-from-mag-ang r a)
		((get 'make-from-mag-ang 'polar) r a))
	
	(define (add-complex z1 z2)
		(make-from-real-image (+ (real-part z1) (real-part z2))
									(+ (image-part z1) (image-part z2))))
	(define (sub-complex z1 z2)
		(make-from-real-image (- (real-part z1) (real-part z2))
									(= (image-part z1) (image-part z2))))
	(define (mul-complex z1 z2)
		(make-from-mag-ang (* (magnitude z1) (magnitude z2))
								 (+ (angle z1) (angle z2))))
	(define (div-complex z1 z2)
		(make-from-mag-ang (/ (magnitude z1) (magnitude z2))
								 (- (angle z1) (angle z2))))
	;;interface for rest system
	(define (tag x)
		(attach-tag 'complex x))
	(put 'add '(complex complex) (lambda (z1 z2) (tag (add-complex z1 z2))))
	(put 'sub '(complex complex) (lambda (z1 z2) (tag (sub-complex z1 z2))))
	(put 'mul '(complex complex) (lambda (z1 z2) (tag (mul-complex z1 z2))))
	(put 'div '(complex complex) (lambda (z1 z2) (tag (div-complex z1 z2))))
	(put 'make-from-real-image 'complex (lambda (x y) (tag (make-from-real-image x y))))
	(put 'make-from-mag-ang 'complex (lambda (r a) (tag (make-from-mag-ang r a))))
	(put 'real-part '(complex) real-part)
	(put 'image-part '(complex) image-part)
	(put 'magnitude '(complex) magnitude)
	(put 'angle '(complex) angle)
'done)
