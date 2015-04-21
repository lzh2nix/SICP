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

(define (all-ordered-triples n)
	(flatmap (lambda (i) 
					(flatmap (lambda (j) 
									(map (lambda (k) (list k j i)) 
									(enumerate-interval 0 j))) 
						(enumerate-interval 0 i)))
				(enumerate-interval 0 n)))

(define (sum-of-triples-equal-n n)
	(filter (lambda (seq) (= (accumulate + 0 seq) n)) (all-ordered-triples n)))

;test code
(all-ordered-triples 1)
(all-ordered-triples 2)
(all-ordered-triples 3)
(all-ordered-triples 10)
(sum-of-triples-equal-n 1)
(sum-of-triples-equal-n 2)
(sum-of-triples-equal-n 3)
(sum-of-triples-equal-n 10)
