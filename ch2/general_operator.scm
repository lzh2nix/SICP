(cf "type-tag.scm")
(load "type-tag")

(define put 2d-put!)
(define get 2d-get)
(cf "install-scheme-number-package.scm")
(load "install-scheme-number-package")
(install-scheme-number-package)

(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op (car type-tags))))
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

;test
(define number-1 (make-scheme-number 1))
(define number-2 (make-scheme-number 2))
(add number-1 number-2)
(sub number-1 number-2)
(mul number-1 number-2)
(div number-1 number-2)
