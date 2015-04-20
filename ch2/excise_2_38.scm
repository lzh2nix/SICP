(define (fold-left op inital sequence)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest)) (cdr rest))))
	(iter inital sequence))

(define (fold-right op initial sequence)
   (if (null? sequence)
      initial
      (op (car sequence) (fold-right op initial (cdr sequence)))))

;test code
(fold-left + 0 (list 1 2 3 4 5))
(fold-right + 0 (list 1 2 3 4 5))

(define (reverse sequence)
	(fold-left (lambda (x y) (cons y x)) '() sequence))

;test code
(reverse (list 1 2 3 4 5))
(reverse (list (list 1 2) (list 3 4) 5))
(reverse (list (list 1 2) (list 3 4) (list 5)))

(define (reverse sequence)
	(fold-right (lambda (x y) (append y  (list x))) '() sequence))
