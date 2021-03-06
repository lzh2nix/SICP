(define (sum-of-odd-squares tree)
	(cond ((null? tree) 0)
			((not (pair? tree))
				(if (odd? tree)
					(square tree)
					0))
			(else (+ (sum-of-odd-squares (car tree)) (sum-of-odd-squares (cdr tree))))))

(define (fib n)
	(cond ((= 0 n) 0)
			((= 1 n) 1)
			(else (+ (fib (- n 1)) (fib (- n 2))))))

(define (evens-fibs n)
	(define (iter k)
		(if (> k n)
			'()
			(let ((f (fib k)))
				(if (even? f)
					(cons f (iter (+ k 1)))
					(iter (+ k 1))))))
	(iter 0))

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

(define (enumerate-tree tree)
	(cond ((null? tree) '())
			((not (pair? tree)) (list tree))
			(else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))))
