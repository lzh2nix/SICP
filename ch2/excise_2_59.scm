(define (equal? a b)
   (if (not (pair? a))
         (eq? a b)
      (and
         (equal? (car a) (car b))
         (equal? (cdr a) (cdr b)))))

(define (element-of-set? x s)
	(cond ((null? s) #f)
			((equal? x (car s)) #t)
			(else
				(element-of-set? x (cdr s)))))


(define (adjoin-set x s)
	(if (element-of-set? x s)
		s
		(cons x s)))

(define (intersection-set set1 set2)
	(cond ((null? set1) '())
			((null? set2) '())
			((element-of-set? (car set1) set2)
				(cons (car set1) (intersection-set (cdr set1) set2)))
			(else
				(intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
	(cond ((null? set1) set2)
			((null? set2) set1)
			((element-of-set? (car set1) set2)
				(union-set (cdr set1) set2))
			(else
				(cons (car set1) (union-set (cdr set1) set2)))))
;test
(adjoin-set 1 (list 1 2 3))
(adjoin-set 1 (list 2 3 4))
(intersection-set (list 1 2 4) (list 4 5 6))
(intersection-set (list 4 5 6) (list 4 5 6))
(intersection-set (list 1 2 3 4 5 6 9 8 10) (list 4 5 6))
(union-set (list 1 2 4) (list 4 5 6))
(union-set (list 4 5 6) (list 4 5 6))
(union-set (list 1 2 3 4 5 6 9 8 10) (list 4 5 6))
