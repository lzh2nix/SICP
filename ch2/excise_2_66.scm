(cf "excise_2_63.scm")
(load "excise_2_63.scm")

(define (lookup tree given-key)
	(cond ((null? tree) #f)
			((= given-key (key (car tree))) (car tree))
			((> given-key (key (car tree))) (lookup (right-branch tree) given-key))
			(else
				(lookup (left-branch tree) given-key))))
(define (key ele)
	(car ele))
;test
(define a (list 1 "aaa"))
(define b (list 2 "bbb"))
(define c (list 3 "ccc"))
(define d (list 4 "ddd"))
(define e (list 5 "eee"))
(define f (list 6 "fff"))
(define g (list 7 "ggg"))
(define h (list 8 "hhh"))
(define tree (make-tree d
								(make-tree b 
											  (make-tree a '() '())
											  (make-tree c '() '()))
								(make-tree f
											  (make-tree e '() '())
											  (make-tree g 
														    '() 
															 (make-tree h '() '())))))

(lookup tree 1)
(lookup tree 2)
(lookup tree 3)
(lookup tree 4)
(lookup tree 5)
(lookup tree 6)
(lookup tree 7)
(lookup tree 8)
(lookup tree 9)
