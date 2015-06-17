(define (make-leaf symbol weight)
	(list 'leaf symbol weight))
(define (leaf? object)
	(eq? (car object) 'leaf))

(define (symbol-leaf leaf)
	(cadr leaf))
(define (weight-leaf leaf)
	(caddr leaf))

(define (make-code-tree left right)
	(list left right (append (symbols left) (symbols right))
		(+ (weight left) (weight right))))

(define (symbols tree)
	(if (leaf? tree)
		(list (symbol-leaf tree))
		(caddr tree)))

(define (weight tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(cadddr tree)))
(define (left-branch tree)
	(car tree))
(define (right-branch tree)
	(cadr tree))

(define (choose-branch bit branch)
	(cond ((= 0 bit) (left-branch branch))
			((= 1 bit) (right-branch branch))
			(else
				(error "bad bit, bit must be 0 or 1" bit))))
;test
(define (decode bits tree)
	(define (decode-1 bits current-branch)
		(if (null? bits)
			'()
			(let ((next-branch (choose-branch (car bits) current-branch)))
				(if (leaf? next-branch)
					(cons (symbol-leaf next-branch) 
							(decode-1 (cdr bits) tree))
					(decode-1 (cdr bits) next-branch)))))
	(decode-1 bits tree))
(define sample-tree 
	(make-code-tree (make-leaf 'A 4)
		(make-code-tree (make-leaf 'B 2)
			(make-code-tree (make-leaf 'D 1)
				(make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)

(define (adjoin-set x set)
	(cond ((null? set) (list x))
			((< (weight x) (weight (car set))) (cons x set))
			(else
				(cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
	(if (null? pairs) 
		'()
		(let ((pair (car pairs)))
			(adjoin-set (make-leaf (car pair) (cadr pair))
				(make-leaf-set (cdr pairs))))))

;test
(make-leaf-set (list (list 'A 4) (list 'B 2) (list 'C 1) (list 'D 1)))
