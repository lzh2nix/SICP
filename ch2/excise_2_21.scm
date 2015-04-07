(define (map proc items)
	(if (null? items)
		'()
		(cons (proc (car items)) (map proc (cdr items)))))

(define (square-list items)
	(map square items))

(define (square-list-v2 items)
	(if (null? items)
		'()
		(cons (square (car items)) (square-list-v2 (cdr items)))))

(map abs (list 1 2 3 4 -1 -10 -12))
(square-list (list 1 2 3 4 5 6 7))
(square-list-v2 (list 1 2 3 4 5 6 7))
