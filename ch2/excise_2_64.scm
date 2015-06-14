(cf "excise_2_63.scm")
(load "excise_2_63.scm")

(define (list->tree elements)
	(car (partial-tree elements (length elements))))

(define (partial-tree elets n)
	(if (= 0 n)
		(cons '() elets)
		(let ((left-size (quotient (- n 1) 2)))
			(let ((left-result (partial-tree elets left-size)))
				(let ((left-tree (car left-result))
						(non-left-elets (cdr left-result))
						(right-size (- n (+ left-size 1))))
					(let ((this-entry (car non-left-elets))
							(right-result (partial-tree (cdr non-left-elets) right-size)))
						(let ((right-tree (car right-result))
								(remaining-elts (cdr right-result)))
							(cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))


;test
(list->tree (list 1))
(list->tree (list 1 2))
(list->tree (list 1 2 3))
(list->tree (list 1 3 5 7 9 11))
