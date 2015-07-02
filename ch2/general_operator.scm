(cf "type-tag.scm")
(load "type-tag")
(define *op-table* (make-hash-table))

(define (put op type proc)
  (hash-table/put! *op-table* (list op type) proc))
(define (get op type)
  (hash-table/get *op-table* (list op type) #f))


(define *coercion-table* (make-hash-table))
(define (put-coercion op type proc)
	(hash-table/put! *coercion-table* (list op type) proc))
(define (get-coercion op type)
	(hash-table/get *coercion-table* (list op type) #f))

(define (equal? a b)
   (if (not (pair? a))
         (eq? a b)
      (and
         (equal? (car a) (car b))
         (equal? (cdr a) (cdr b)))))

(cf "install-scheme-number-package.scm")
(load "install-scheme-number-package")

(cf "install-polar-package.scm")
(load "install-polar-package")

(cf "install-rectangular-package.scm")
(load "install-rectangular-package")

(cf "install-complex-package.scm")
(load "install-complex-package")

(define (add_2_obj type-tags args op)
	(let ((type1 (car type-tags))
			(type2 (cadr type-tags))
        	(a1 (car args))
        	(a2 (cadr args)))
		(let ((t1->t2 (get-coercion type1 type2))
       		(t2->t1 (get-coercion type2 type1))
				(proc (get op type-tags)))
			(if proc
				(apply proc (map (lambda (x) (cadr x)) args))
				(cond (t1->t2 (apply-generic op (list (t1->t2 a1) a2)))
        				(t2->t1 (apply-generic op (list a1 (t2->t1 a2))))
        				(else
        					(display (list type-tags))))))))
(define (add_n_obj args op)
	(let ((op1 (car args))
			(op2 (cadr args))
			(last (cdr (cdr args))))
		(if (null? last) 
			(apply-generic op (list op1 op2))
			(add_n_obj (cons (apply-generic op (list op1 op2)) last) op))))
(define (apply-generic op args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map (lambda (x) (cadr x)) args))
				(cond ((= (length args) 2) (add_2_obj type-tags args op))
						((>= (length args) 3) (add_n_obj args op))
						(else
							(error "No Method for these types ---" (list type-tags))))))))

(define (add . n) (apply-generic 'add n))
(define (sub . n) (apply-generic 'sub n))
(define (mul . n) (apply-generic 'mul n))
(define (div . n) (apply-generic 'div n))

(define (make-scheme-number x)
	((get 'make 'scheme-number) x))
(define (make-from-real-image x y)
	((get 'make-from-real-image 'complex) x y))
(define (make-from-mag-ang r a)
	((get 'make-from-mag-ang 'complex) r a))

(define (real-part . z) (apply-generic 'real-part z))
(define (image-part . z) (apply-generic 'image-part z))
(define (magnitude . z) (apply-generic 'magnitude z))
(define (angle . z) (apply-generic 'angle z))
(define (equ?  . n) (apply-generic 'eq  n))
(define (zero? . n) (apply-generic 'zero n))
(define (exp x y) (apply-generic 'exp (list x y)))
(install-scheme-number-package)
(install-polar-package)
(install-rectangular-package)
(install-complex-package)

;test
(define number-1 (make-scheme-number 1))
(define number-2 (make-scheme-number 2))
(add number-1 number-2)
(sub number-1 number-2)
(mul number-1 number-2)
(div number-1 number-2)

(define z1 (make-from-real-image 1 1))
(define z3 (make-from-real-image 1 1))
(define z2 (make-from-mag-ang (sqrt 2) .7853981633974483))

(add z1 z2)
(sub z1 z2)
(mul z1 z2)
(div z1 z2)

(zero? number-1)
(zero? number-1)

(zero? (make-from-real-image 0 0))
(zero? (make-from-mag-ang 0 0))

(add z1 number-1)
(add number-1 z1)
(add z1 z2 z3 z1 z2 z3)
(mul z1 z2 z3 z1 z2 z3)
(sub z1 z2 z3 z1 z2 z3)
(add z1 z2 z3 z1 z2 z3 number-1 number-2 number-3)
