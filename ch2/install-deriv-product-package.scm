(cf "type-tag.scm")
(load "type-tag")

(define (install-deriv-product-package)
	;;internal procedures
	(define (make-product m1 m2)
		(cond ((=number? m1 0) 0)
			((=number? m2 0) 0)
			((=number? m1 1) m2)
			((=number? m2 1) m1)
			((and (number? m1) (number? m2)) (* m1 m2))
			(else
				(list '* m1 m2))))
	(define (deriv exp var)
		(make-sum 
					(make-product (multiplier exp) (deriv (multiplicand exp) var))
					(make-product (multiplicand exp) (deriv (multiplier exp) var))))
	(define (multiplier s)(cadr s))
	(define (multiplicand s) (caddr s))
	(define (tag x) (attch-tag 'product x))
	(put 'mutltipiler '(product) multiplier)
	(put 'multiplicand '(product) multiplicand)
	(put 'make-product 'product make-product)
	(put 'deriv 'product deriv)
'done)
