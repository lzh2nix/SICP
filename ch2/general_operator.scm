(cf "type-tag.scm")
(load "type-tag")
(define *op-table* (make-hash-table))

(define (put op type proc)
  (hash-table/put! *op-table* (list op type) proc))
(define (get op type)
  (hash-table/get *op-table* (list op type) #f))
(cf "install-scheme-number-package.scm")
(load "install-scheme-number-package")

(cf "install-polar-package.scm")
(load "install-polar-package")

(cf "install-rectangular-package.scm")
(load "install-rectangular-package")

(cf "install-complex-package.scm")
(load "install-complex-package")

(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map (lambda (x) (cadr x)) args))
				(error
					"NO method for these types ----" (list args))))))

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (make-scheme-number x)
	((get 'make 'scheme-number) x))
(define (make-from-real-image x y)
	((get 'make-from-real-image 'complex) x y))
(define (make-from-mag-ang r a)
	((get 'make-from-mag-ang 'complex) r a))

(define (real-part z) (apply-generic 'real-part z))
(define (image-part z) (apply-generic 'image-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(install-scheme-number-package)
(install-polar-package)
(install-rectangular-package)
(install-complex-package)

;test
(define number-1 (make-scheme-number 1))
(define number-2 (make-scheme-number 2))
(add number-1 number-2)
(sub number-1 number-2)
(mul number-1 number-2)
(div number-1 number-2)

(define z1 (make-from-real-image 1 1))
(define z3 (make-from-real-image 1 1))
(define z2 (make-from-mag-ang (sqrt 2) .7853981633974483))

(add z1 z2)
(sub z1 z2)
(mul z1 z2)
(div z1 z2)
