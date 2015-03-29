;returns the rational number 
;whose numerator is the integer <n> and whose de;
;nominator is the integer <d>
(define make-rat cons)
(define numer car)
(define denom cdr)

;n1/d1 + n2/d2 = (n1d2 + n2d1)/d1d2
(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
				(* (denom x) (denom y))))

;n1/d1 - n2/d2 = (n1d2 - n2d1)/d1d2
(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
				(* (denom x) (denom y))))

;n1/d1 * n2/d2 = n1n2/d1d2
(define (mul-rat x y)
	(make-rat (* (numer x) (numer y)) (* (denom x) (denom y))))

;n1/d1 / n2/d2 = n1d2 / d1n2
(define (div-rat x y)
	(make-rat (* (numer x) (denom y)) (* (numer y) (denom x))))

;n1/d1 == n2/d2
(define (equal-rat? x y)
	(= (* (numer x) (denom y)) (* (numer y) (denom x))))
(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))

;1/2
(define one-half (make-rat 1 2))
;1/3
(define one-third (make-rat 1 3))

;1/2 + 1/3 = 5/6
(print-rat (add-rat one-half one-third))

;1/2 - 1/3 = 1/6
(print-rat (sub-rat one-half one-third))

;1/2 * 1/3 = 1/6
(print-rat (mul-rat one-half one-third))

;1/2 / 1/3 = 3/2
(print-rat (div-rat one-half one-third))
