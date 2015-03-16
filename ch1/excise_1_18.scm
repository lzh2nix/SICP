(define (even? n)
	(= 0 (remainder n 2)))

;if we want m*n, every term m*2 and n/2,
;m*n = sum{m(if n is odd)} here is a example of 18*19
;	18		19
;	36		9
;	72		4
;	144	2
;	288	1
; m*n = 288 + 36 + 18
(define (russia_add a b sum)
	(cond ((or (= a 0) (= b 0)) 0)
			((= b 1) (+ a sum))
			((even? b) (russia_add (* a 2) (/ b 2) sum))
			(else (russia_add (* a 2) (/ (- b 1) 2) (+ sum a)))))
