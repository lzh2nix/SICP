(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
	(cond ((null? sequence) '())
			((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
			(else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ 1 low) high))))

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

(define (remove sets item)
	(filter (lambda (x) (not (= x item))) sets))
(define (permutations s)
	(if (null? s)
		(list '())
		(flatmap 
			(lambda(x) 
				(map (lambda (p) (cons x p))
					(permutations (remove s x)))) s)))

;test code 
(remove (list 1 2 3 4 5) 1)
(permutations (list 1 2 3))
