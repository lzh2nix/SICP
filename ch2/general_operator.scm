(cf "type-tag.scm")
(load "type-tag")

(cf "install-scheme-number-package.scm")
(load "install-scheme-number-package")
(define put 2d-put!)
(define get 2d-get)
(install-scheme-number-package)

(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (contents args))
				(error
					"NO method for these types ----" (list args))))))

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (make-scheme-number x)
	((get 'make 'scheme-number) x))
