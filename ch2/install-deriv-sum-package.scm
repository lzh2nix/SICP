(cf "type-tag.scm")
(load "type-tag")
(define (install-deriv-sum-pakage)
	;;internal procedures
	(define (addend s) (car s))
	(define (augend s) (cadr s))
	(define (make-sum a1 a2)
		(cond ((=number? a1 0) a2)
			((=number? a2 0) a1)
			((and (number? a1) (number? a2)) (+ a1 a2))
			(else
				(attach-tag '+ a1 a2))))
	;;interface for  rest of system
	(define (tag x) (attach-tag 'sum x))
	(put 'addend '+ addend)
	(put 'augend '+ augend)
	(put 'make-sum '+ make-sum)
	(put 'deriv '+
        (lambda (exp var)
            (make-sum (deriv (addend exp) var)
                      (deriv (augend exp) var))))
'done)
