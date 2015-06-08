(define (equal? a b)
   (if (not (pair? a))
         (eq? a b)
      (and
         (equal? (car a) (car b))
         (equal? (cdr a) (cdr b)))))

(define (element-of-set? x s)
	(cond ((null? s) #f)
			((< x (car s)) #f)
			((= x (car s)) #t)
			(else
				(element-of-set? x (cdr s)))))

(define (intersection-set set1 set2)
	(if (or (null? set1) (null? set2))
		'()
		(let ((x1 (car set1)) (x2 (car set2)))
			(cond ((= x1 x2)
						(cons x1 (intersection-set (cdr set1) (cdr set2))))
					((< x1 x2)
						(intersection-set (cdr set1) set2))
					((> x1 x2 )
						(intersection-set set1 (cdr set2)))))))
;test
(intersection-set (list 1 2 3) (list 1 2 3))
(intersection-set (list 1 2 3 4 5 6) (list 1 2 3))
(intersection-set (list 1 2 3 4 5 6) (list 4 5 6))
(intersection-set (list 4 5 6) (list 1 2 3 4 5 6))
(intersection-set (list 1 2 3) (list 4 5 6))

(define (adjoin-set x set)
	(if (element-of-set? x set)
		set
		(cond ((null? set) (list x))
				((< x (car set)) (cons x set))
				(else
					(cons (car set) (adjoin-set x (cdr set)))))))

;test
(adjoin-set 1 (list 2 3 4 5))
(adjoin-set 3 (list 1 2 4 5))
(adjoin-set 6 (list 1 3 4 5))
