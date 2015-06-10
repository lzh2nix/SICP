(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right) (list entry left right))

(define (element-of-tree? element tree)
	(cond ((null? tree) #f)
			((= element (entry tree)) #t)
			((> element (entry tree)) 
				(element-of-tree? element (right-branch tree)))
			(else
				(element-of-tree? element (left-branch tree)))))

;test
(define tree (make-tree 7
					(make-tree 3 
						(make-tree 1 '() '()) 
						(make-tree 5 '() '()))
					(make-tree 9 
						'() 
						(make-tree 11 '() '()))))

(element-of-tree? 1 tree)
(element-of-tree? 9 tree)
(element-of-tree? 11 tree)
(element-of-tree? 7 tree)
(element-of-tree? 5 tree)
(element-of-tree? 6 tree)
(element-of-tree? 10 tree)
(element-of-tree? 100 tree)
(element-of-tree? 0 tree)

(define (adjoin-tree element tree)
	(cond ((null? tree) (make-tree element '() '()))
			((= element (entry tree)) tree)
			((> element (entry tree))
				(make-tree (entry tree) (left-branch tree) (adjoin-tree element (right-branch tree))))
			(else
				(make-tree (entry tree)(adjoin-tree element (left-branch tree)) (right-branch tree)))))

;test
(adjoin-tree 10 tree)
(adjoin-tree 100 tree)
(adjoin-tree 10 tree)
(adjoin-tree 0 tree)

(define (tree-to-list tree)
	(if (null? tree)
		'()
		(append (tree-to-list (left-branch tree))
			(cons (entry tree) (tree-to-list (right-branch tree))))))
;test
(tree-to-list tree)
