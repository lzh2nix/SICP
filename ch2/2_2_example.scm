(define (list-reference items n)
	(if (= n 0)
		(car items)
		(list-reference (cdr items) (- n 1))))

(define list-items (list 1 2 3 4 5 6 7 8 9))

(define (length items)
	(if (null? items)
		0
		(+ 1 (length (cdr items)))))

;(list 1 2 3 4) = (cons 1 (cons 2 (cons 3 (cons 4 '()))))
(define (append list1 list2)
	(if (null? list1)
		list2
		(cons (car list1) (append (cdr list1) list2))))

