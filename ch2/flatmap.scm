(define (smallest-divisor? n)
   (find-divisor n 2))

(define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
      ((divides? n test-divisor) test-divisor)
      (else (find-divisor n (+ test-divisor 1)))))

(define (divides? n m)
   (= (remainder n m) 0))

(define (prime? n)
   (= (smallest-divisor? n) n))

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
(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
	(map make-pair-sum 
		 (filter prime-sum? 
			(flatmap 
				(lambda (i) 
					(map (lambda (j) (list i j)) 
						(enumerate-interval 1 (- i 1))))
			(enumerate-interval 1 n)))))

;test code
(prime-sum-pairs 6)
