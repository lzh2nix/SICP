(define put 2d-put!)
(define get 2d-get)
(cf "install-deriv-sum-package.scm")
(load "install-deriv-sum-package")
(cf "install-deriv-product-package.scm")
(load "install-deriv-product-package")

(install-deriv-sum-pakage)
(install-deriv-product-package)
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (variable? s) (symbol? s))
(define (same-variable? a b) 
	(and (variable? a ) (variable? b) (eq? a b)))

(define (make-sum op1 op2) ((get 'make-sum '+) op1 op2))
(define (deriv exp var)
	(cond ((number? exp) 0)
			((variable? exp) (if (same-variable? exp var) 1 0))
			(else
				((display exp)((get 'deriv (operator exp)) (operands exp) var)))))
