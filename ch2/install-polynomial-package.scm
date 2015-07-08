(define (install-polynomial-package)
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  
  (define (variable? s) (symbol? s))
  (define (same-variable? a b)
    (and (variable? a ) (variable? b) (eq? a b)))
  
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1) 
		   (add-terms (term-list p1) 
			      (term-list p2)))
	(error "Poly not in same variable" (list p1 p2))))

  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error "Poly not in same variable" (list p1 p2))))
  (define (zero-poly poly)
    (let ((term-list-1 (term-list poly)))
      (if (empty-term-list? term-list-1)
	  #f
	  (and (zero? (coeff (first-term term-list-1)))
	       (zero-poly (rest-term (term-list-1)))))))
  (define (tag p)
    (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  (put 'zero '(polynomial) 
       (lambda (var-terms) 
	 (if (empty-term-list? (term-list var-terms))
	     #t
	     (zero-poly (term-list var-terms)))))
  'done)

(define (empty-term-list? L)
  (null? L))
(define (first-term term-list)
  (car term-list))
(define (rest-term term-list)
  (cdr term-list))
(define (order term)
  (car term))
(define (coeff term)
  (cadr term))
(define (make-term order coeff)
  (list order coeff))
(define (adjoin-term term term-list)
  (if (zero? (coeff term))
      term-list
      (cons term term-list)))
(define the-empty-term-list '())
(define (add-terms-hp L1 L2)
  (let ((t1 (first-term L1)) (t2 (first-term L2)))
    (cond ((great? (order t1) (order t2))
	   (adjoin-term t1 (add-terms (rest-term L1) L2)))
	  ((less? (order t1) (order t2))
	   (adjoin-term t2 (add-terms L1 (rest-term L2))))
	  (else
	   (adjoin-term (make-term (order t1)
				   (add (coeff t1) (coeff t2)))
			(add-terms (rest-term L1)
				   (rest-term L2)))))))
(define (add-terms L1 L2)
  (cond ((empty-term-list? L1) L2)
	((empty-term-list? L2) L1)
	(else
	 (add-terms-hp L1 L2))))
(define (mul-terms-by-all-terms t1 L)
  (if (empty-term-list? L)
      the-empty-term-list
      (let ((t2 (first-term L)))
	(adjoin-term (make-term (add (order t1) (order t2))
				(mul (coeff t1) (coeff t2)))
		     (mul-terms-by-all-terms t1 (rest-term L))))))
(define (mul-terms L1 L2)
  (if (empty-term-list? L1)
      the-empty-term-list
      (add-terms (mul-terms-by-all-terms (first-term L1) L2)
		 (mul-terms (rest-term L1) L2))))
