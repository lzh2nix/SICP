(define (variable? s) (symbol? s))
(define (same-variable? a b) 
	(and (variable? a ) (variable? b) (eq? a b)))

(define (=number? a n)
	(and (number? a) (= a n)))
(define (sum? s)
	(and (pair? s) (eq? (car s) '+)))
(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
			((=number? a2 0) a1)
			((and (number? a1) (number? a2)) (+ a1 a2))
			(else
				(list '+ a1 a2))))
(define (addend s)(cadr s))
(define (augend s) (caddr s))


(define (product? s)
	(and (pair? s) (eq? (car s) '*)))
(define (make-product m1 m2)
	(cond ((=number? m1 0) 0)
			((=number? m2 0) 0)
			((=number? m1 1) m2)
			((=number? m2 1) m1)
			((and (number? m1) (number? m2)) (* m1 m2))
			(else
				(list '* m1 m2))))
(define (multiplier s)(cadr s))
(define (multiplicand s) (caddr s))

(define (deriv exp var)
	(cond ((number? exp) 0)
			((variable? exp)
				(if (same-variable? exp var) 1 0))
			((sum? exp)
				(make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
			((product? exp)
				(make-sum 
					(make-product (multiplier exp) (deriv (multiplicand exp) var))
					(make-product (multiplicand exp) (deriv (multiplier exp) var))))
			(else 
				(error "unknow expression type -- DERIV" exp))))
