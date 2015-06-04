(define (equal? a b)
   (if (not (pair? a))
         (eq? a b)
      (and
         (equal? (car a) (car b))
         (equal? (cdr a) (cdr b)))))

(define (element-of-set? x s)
	(cond ((< x (car s)) #f)
			((= x (car s)) #t)
			(else
				(element-of-set? x (cdr s)))))
