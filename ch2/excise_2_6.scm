(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
	(lambda (f) (lambda (x) (n f) x)))

;0 ≡ λf.λx. x
;1 ≡ λf.λx. f x
(define one (lambda (f) (lambda (x) (f x))))
;2 ≡ λf.λx. f (f x)
(define two (lambda (f) (lambda (x) (f (f x)))))
;3 ≡ λf.λx. f (f (f x))
(define three (lambda (f) (lambda (x) (f (f (f x))))))

;3 = one + two
(define (add m n)
	(lambda (f) (lambda (x) ((m f) ((n f) x)))))
;test for excise
((one (lambda (x) (+ x 1))) 0)
((two (lambda (x) (+ x 1))) 0)
((three (lambda (x) (+ x 1))) 0)
(((add one two) (lambda (x) (+ x 1))) 0)
