(define (square-tree tree)
	(cond ((null? tree) '())
			((not (pair? tree)) (square tree))
			(else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree-1 tree)
	(map (lambda (sub-tree)
			(if (pair? sub-tree)
				(square-tree-1 sub-tree)
				(square sub-tree))) tree))
;test code
(define y (list 1 (list 2 (list 3 4) 5 (list 6 7)))
(square-tree y)
(square-tree-1 y)
