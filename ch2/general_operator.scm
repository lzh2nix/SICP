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
      (if (number? a)
	  (= a b)
	  (eq? a b))
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

(cf "install-rational-package.scm")
(load "install-rational-package")

(cf "install-polynomial-package.scm")
(load "install-polynomial-package")

(cf "install-dense-poly-package.scm")
(load "install-dense-poly-package")

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

(hash-table/put! *op-table* 'scheme-number  1)
(hash-table/put! *op-table* 'rational  2)
(hash-table/put! *op-table* 'complex  3)
(define (get-for-operator type)
  (hash-table/get *op-table* type #f))

(define (add-2-obj-for-84 type-tags args op)
  (let ((a1 (car args))
	(a2 (cadr args))
	(type1 (car type-tags))
	(type2 (cadr type-tags)))
    (cond ((> (get-for-operator type1) (get-for-operator type2))
	   (apply-generic op (list a1 (raise a2))))
	  ((< (get-for-operator type1) (get-for-operator type2))
	   (apply-generic op (list (raise a1) a2)))
	  (else
	   (error "add-2-obj-for-84:No Method for these types ---" (list type-tags))))))

(define (add-n-obj args op)
  (let ((op1 (car args))
	(op2 (cadr args))
	(last (cdr (cdr args))))
    (if (null? last) 
	(apply-generic op (list op1 op2))
	(add-n-obj (cons (apply-generic op (list op1 op2)) last) op))))
(define (apply-generic op args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map (lambda (x) (cadr x)) args))
	  (cond ((= (length args) 2) (add-2-obj-for-84 type-tags args op))
		((>= (length args) 3) (add-n-obj args op))
		(else
		 (error "apply-generic:No Method for these types ---" (list type-tags))))))))

(define (add . n)
  (if (number? (car n))
      (apply + n)
      (apply-generic 'add n)))
(define (sub . n)
  (if (number? (car n))
      (apply - n)
      (apply-generic 'sub n)))
(define (mul . n)
  (if (number? (car n))
      (apply * n)
      (apply-generic 'mul n)))

(define (div . n)
  (if (number? (car n))
      (apply / n)
      (apply-generic 'div n)))
(define (greatest-common-divisor . n)
  (if (number? (car n))
      (apply gcd n)
      (apply-generic 'gcd n)))
(define (make-scheme-number x)
  ((get 'make 'scheme-number) x))
(define (make-from-real-image x y)
  ((get 'make-from-real-image 'complex) x y))
(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))
(define (make-rational n d)
  ((get 'make 'rational) n d))
(define (make-polynomial var terms)
  ((get 'make 'polynomial) var terms))
(define (make-dense-poly var terms)
  ((get 'make 'dense-poly) var terms))
(define (real-part . z) (apply-generic 'real-part z))
(define (image-part . z) (apply-generic 'image-part z))
(define (magnitude . z) (apply-generic 'magnitude z))
(define (angle . z) (apply-generic 'angle z))
(define (equ?  . n) (apply-generic 'eq  n))
(define (zero? . n) (apply-generic 'zero n))
(define (gcd-scheme-number . n) (apply-generic 'gcd-scheme-number n))
(define (gcd-poly . n) (apply-generic 'gcd n))
(define (round-scheme-number . n) (apply-generic 'round-scheme-number n))
(define (great? . n) (apply-generic 'great n))
(define (less? . n) (apply-generic 'less n))
(define (raise . n) (apply-generic 'raise n))
(define (drop . n) (apply-generic 'drop n))
(define (exp x y) (apply-generic 'exp (list x y)))
(define (inverse . n) (apply-generic 'inverse n))
(install-scheme-number-package)
(install-polar-package)
(install-rectangular-package)
(install-complex-package)
(install-rational-package)
(install-polynomial-package)
(install-dens-poly-package)
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

(define r1 (make-rational 1 2))
(define r2 (make-rational 1 2))
(define r3 (make-rational 3 4))
(zero? number-1)
(zero? number-1)

(zero? (make-from-real-image 0 0))
(zero? (make-from-mag-ang 0 0))

(add z1 number-1)
(add number-1 z1)
(add z1 z2 z3 z1 z2 z3)
(mul z1 z2 z3 z1 z2 z3)
(sub z1 z2 z3 z1 z2 z3)
(add z1 z2 z3 z1 z2 z3 number-1 number-2)
(add z1 z2 z3 z1 z2 z3 number-1 number-2 r1 r2 r3)
(drop (make-rational 10 4))
(drop (make-rational 10 2))
(drop number-1)
(drop (make-from-real-image 10 0))
(drop (make-from-real-image 10.3 0))
(drop (make-from-real-image 10.3 1))

;test for polynomial system
(define t11 (make-term (make-scheme-number 2) (make-scheme-number 3)))
(define t12 (make-term (make-scheme-number 1) (make-scheme-number 2)))
(define t13 (make-term (make-scheme-number 0) (make-scheme-number 5)))
(define t21 (make-term (make-scheme-number 2) (make-scheme-number 2)))

(define term-list-1 (adjoin-term t11
				 (adjoin-term t12
					      (adjoin-term t13 the-empty-term-list))))
(define term-list-2 (adjoin-term t21 the-empty-term-list))
(define poly-1 (make-polynomial 'x term-list-1))
(define poly-2 (make-polynomial 'x term-list-2))
(define poly-1 (make-polynomial 'x term-list-1))
(add poly-1 poly-2)

;test for zero polynomial
(define t41 (make-term (make-scheme-number 2) (make-scheme-number 0)))
(define t42 (make-term (make-scheme-number 1) (make-scheme-number 0)))
(define t43 (make-term (make-scheme-number 0) (make-scheme-number 0)))
(define term-list-4 (adjoin-term t41
				 (adjoin-term t42
					      (adjoin-term t43 the-empty-term-list))))
(define poly-4 (make-polynomial 'x term-list-4))

(zero? poly-4)

(define t31 (make-term (make-scheme-number 2) (make-scheme-number 2)))
(define term-list-31 (adjoin-term t31 the-empty-term-list))
(define term-31 (make-polynomial 'y term-list-31))
(define t311 (make-term (make-scheme-number 2) term-31))
(define term-list-31 (adjoin-term t311 the-empty-term-list))
(define poly-3 (make-polynomial 'x term-list-31))
(zero? poly-3)
(sub poly-1 poly-1)
(sub poly-1 poly-2)

(define term-list-4 (list (make-scheme-number 1)
                          (make-scheme-number 2)
                          (make-scheme-number 0)
                          (make-scheme-number 3)
                          (make-scheme-number (- 2))
                          (make-scheme-number (- 5))))

(define term-list-5 (list (make-scheme-number 2)
                          (make-scheme-number 0)
                          (make-scheme-number 0)
                          (make-scheme-number 0)
                          (make-scheme-number 2)))

(define term-list-6 (list (make-scheme-number 0)
                          (make-scheme-number 0)
                          (make-scheme-number 0)
                          (make-scheme-number 0)
                          (make-scheme-number 0)
                          (make-scheme-number 0)))

(define poly-4 (make-dense-poly 'x term-list-4))

(define poly-5 (make-dense-poly 'x term-list-5))
(define poly-6 (make-dense-poly 'x term-list-6))

(zero? poly-4)
(zero? poly-5)
(zero? poly-6)
(add poly-4 poly-5)
(mul poly-4 poly-5)
(add poly-5 poly-6)
(mul poly-5 poly-6)
(add poly-4 poly-5 poly-6)
(add poly-4 poly-5 poly-5 poly-4)
(mul poly-4 poly-5 poly-6)
(mul poly-4 poly-5 poly-5 poly-5)


;tes for div polynomial
(define t61 (make-term (make-scheme-number 5) (make-scheme-number 1)))
(define t62 (make-term (make-scheme-number 0) (make-scheme-number (- 1))))

(define t71 (make-term (make-scheme-number 2) (make-scheme-number 1)))
(define t72 (make-term (make-scheme-number 0) (make-scheme-number (- 1))))

(define term-list-8 (adjoin-term t61
                                 (adjoin-term t62 the-empty-term-list)))
(define term-list-9 (adjoin-term t71
                                 (adjoin-term t72 the-empty-term-list)))

 (div-terms term-list-9 term-list-8)
 (div-terms term-list-8 term-list-9)


;test for 2.94
(define t100 (make-term (make-scheme-number 2) (make-scheme-number 1)))
(define t101 (make-term (make-scheme-number 0) (make-scheme-number 1)))

(define t103 (make-term (make-scheme-number 3) (make-scheme-number 1)))
(define t104 (make-term (make-scheme-number 0) (make-scheme-number 1)))

(define term-list-10 (adjoin-term t100
                                 (adjoin-term t101 the-empty-term-list)))
(define term-list-11 (adjoin-term t103
                                 (adjoin-term t104 the-empty-term-list)))

(define p1 (make-polynomial 'x term-list-10))
(define p2 (make-polynomial 'x term-list-11))

(define rf (make-rational p2 p1))
(add rf rf)


;test for 2.95
(define t105 (make-term (make-scheme-number 2) (make-scheme-number 1)))
(define t106 (make-term (make-scheme-number 1) (make-scheme-number (- 2))))
(define t107 (make-term (make-scheme-number 0) (make-scheme-number 1)))

(define t108 (make-term (make-scheme-number 2) (make-scheme-number 11)))
(define t109 (make-term (make-scheme-number 0) (make-scheme-number 7)))

(define t110 (make-term (make-scheme-number 3) (make-scheme-number 11)))
(define t111 (make-term (make-scheme-number 0) (make-scheme-number 5)))

(define term-list-13 (adjoin-term t105
                                 (adjoin-term t106
                                              (adjoin-term t107 the-empty-term-list))))

(define term-list-14 (adjoin-term t108
                                 (adjoin-term t109 the-empty-term-list)))
(define term-list-15 (adjoin-term t110
                                 (adjoin-term t111 the-empty-term-list)))

(define p3 (make-polynomial 'x term-list-13))
(define p4 (make-polynomial 'x term-list-14))
(define p5 (make-polynomial 'x term-list-15))

(define q1 (mul p3 p4))
(define q2 (mul p3 p5))
(greatest-common-divisor q1 q2)
