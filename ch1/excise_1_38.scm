;f(1) = N1/D1
;f(2) = N1(D1+N2/D2)
;f(3) = N1(D1+N1(D2+N3/D3))

(define (cont-frac-rec N D k)
	(define (c-f i)
		(if (= k i)
			(/ (N k) (D k))
			(/ (N i) (+ (D i) (c-f (+ i 1))))))
	(c-f 1))

(define (cont-frac-iter N D k)
	(define (iter i result)
		(let ((item (/ (N i) (+ (D i)  result))))
			(if (= i 1)
				item
				(iter (- i 1) item))))
	(iter k 0))

(define (is_2_plus_n3 x result)
   (cond ((= x result) #t)
      ((< x result) #f)
      (else (is_2_plus_n3 x (+ result 3)))))
(define (D x)
   (cond ((or (= x 1) (= x 2)) x)
      ((is_2_plus_n3 x 2) (+ (D (- x 3)) 2))
      (else 1)))
(cont-frac-iter (lambda (x) 1.0) D 100)

