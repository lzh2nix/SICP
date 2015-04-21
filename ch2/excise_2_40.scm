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

(define (unique-pairs n)
	(flatmap (lambda (x) 
					(map (lambda (p) (list x p)) 
						(enumerate-interval 1 (- x 1)))) (enumerate-interval 2 n)))

;test code
(unique-pairs 3)
(unique-pairs 6)
