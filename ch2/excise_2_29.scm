(define (make-moblie left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cadr mobile))
(define (branch-length branch)
	(car branch))
(define (branch-structure branch)
	(cadr branch))
(define (branch-weight branch)
	(if (not (pair? (branch-structure branch)))
		(branch-structure branch)
		(branch-weight (branch-structure branch))))

(define (total-length mobile)
	(+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define (branch-torque branch)
	(* (branch-length branch) (branch-weight branch)))

(define (branch-balance? branch)
	(if (pair? (branch-structure branch))
		(is-blance? (branch-structure branch))
		#t))
(define (is-blance? moblie)
	(let ((left-b (left-branch moblie))
			(right-b (right-branch moblie)))
		(and (eq? (branch-torque left-b) (branch-torque right-b))
			  (branch-balance? left-b)
			  (branch-balance? right-b))))
;test code
(define left-b (make-branch 1 8))
(define right-b (make-branch 2 4))
(define mobile (make-moblie left-b right-b))

(left-branch mobile)
(right-branch mobile)

(branch-length left-b)
(branch-structure left-b)

(branch-length right-b)
(branch-structure right-b)

(define mobile-1 (make-moblie left-b (make-branch 2 mobile)))
(branch-weight (left-branch mobile-1))
(branch-weight (right-branch mobile-1))
(total-length mobile-1)

(branch-torque left-b)
(branch-torque right-b)
(is-blance? mobile)
(is-blance? mobile-1)

(define mobile-2 (make-moblie left-b (make-branch 3 mobile)))
(is-blance? mobile-2)
