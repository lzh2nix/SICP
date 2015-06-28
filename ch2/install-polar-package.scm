(define (install-polar-package)
	;;internal procedures
	(define (magnitude z) (car z))
	(define (angle z) (cdr z))
	(define (make-from-mag-ang r a) (cons r a))
	(define (real-part z) (* (magnitude z) (cos (angle z))))
	(define (image-part z) (* (magnitude z) (sin (angle z))))
	(define (make-from-real-image x y)
		(cons (sqrt (+ (square x) (square y))) (atan y x)))
	;;interface to the rest of system
	(define (tag x) (attach-tag 'polar x))
	(put 'real-part '(polar) real-part)
	(put 'image-part '(polar) image-part)
	(put 'magnitude '(polar) magnitude)
	(put 'angle '(polar) angle)
	(put 'make-from-mag-ang 'polar 
		(lambda (r a) (tag (make-from-mag-ang r a))))
	(put 'make-from-real-image 'polar 
		(lambda (x y) (tag (make-from-real-image x y))))
	(put 'eq '(polar polar) (lambda (z1 z2) (equal? z1 z2)))
	(put 'eq '(polar rectangular) (lambda (z1 z2) (equal? z1 (make-from-real-image (car z2) (cdr z2)))))
'done)
