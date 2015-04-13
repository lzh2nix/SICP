(define (scale-tree tree factor)
	(cond ((null? tree) '())
			((not (pair? tree)) (* tree factor))
			(else (cons (scale-tree (car tree) factor) (scale-tree (cdr tree) factor)))))

(define (scale-tree-1 tree factor)
	(map (lambda (sub-tree)
			(if (pair? sub-tree)
				(scale-tree-1 sub-tree factor)
				(* sub-tree factor))) tree))
