(define (install-dens-poly-package)
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
  (define (sub-poly p1 p2)
    (add-poly p1 (make-poly (variable p2)(inverse-term (term-list p2)))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error "Poly not in same variable" (list p1 p2))))
  (define (all-terms-zero? term-list)
    (if (empty-term-list? term-list)
        #t
        (and (zero? (car term-list)) (all-terms-zero? (cdr term-list)))))
  (define (zero-poly poly)
    (let ((term-list-1 (term-list poly)))
      (if (empty-term-list? term-list-1)
          #t
          (all-terms-zero? term-list-1))))
  (define (tag p)
    (attach-tag 'dense-poly p))
  (define (empty-term-list? L)
    (null? L))
  (define (first-term term-list)
    (car term-list))
  (define (rest-term term-list)
    (cdr term-list))
  (define (adjoin-term term term-list)
      (cons term term-list))
  (define the-empty-term-list '())
  (define (add-terms-hp L1 L2)
    (let ((t1 (first-term L1)) (t2 (first-term L2)))
      (cond ((> (length L1) (length L2))
	     (adjoin-term t1 (add-terms (rest-term L1) L2)))
	    ((< (length L1) (length L2))
	     (adjoin-term t2 (add-terms L1 (rest-term L2))))
	    (else
	     (adjoin-term (add t1 t2)
			  (add-terms (rest-term L1)
				     (rest-term L2)))))))
  (define (add-terms L1 L2)
    (cond ((all-terms-zero? L1) L2)
          ((all-terms-zero? L2) L1)
          (else
           (add-terms-hp L1 L2))))
  (define (inverse-term L)
    (if (empty-term-list? L)
        the-empty-term-list
        (let ((t1 (first-term L)))
          (adjoin-term (inverse  t1)
                       (inverse-term (rest-term L))))))
  (define (get-empty-term-list n)
    (if (= 0 n)
        the-empty-term-list
        (cons (make-scheme-number 0) (get-empty-term-list (- n 1)))))
  (define (mul-terms-by-all-terms L1 L2)
    (if (empty-term-list? L2)
        (get-empty-term-list (- (length L1) 1))
        (let ((t2 (first-term L2))
              (t1 (first-term L1)))
          (adjoin-term (mul t1 t2)
                       (mul-terms-by-all-terms L1 (rest-term L2))))))
  (define (mul-terms L1 L2)
    (if (empty-term-list? L1)
        the-empty-term-list
        (add-terms (mul-terms-by-all-terms L1 L2)
                   (mul-terms (rest-term L1) L2))))
  (put 'add '(dense-poly dense-poly)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'inverse '(dense-poly)
       (lambda (p) (tag (inverse-term (term-list p)))))
  (put 'sub '(dense-poly dense-poly)
       (lambda (p1 p2) (tag (sub-poly p1 p2))))
  (put 'mul '(dense-poly dense-poly)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'dense-poly
       (lambda (var terms) (tag (make-poly var terms))))
  (put 'zero '(dense-poly)
       (lambda (var-terms)
	 (if (empty-term-list? (term-list var-terms))
	     #t
	     (zero-poly (term-list var-terms)))))
  'done)
