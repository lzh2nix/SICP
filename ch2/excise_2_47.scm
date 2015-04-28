(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2))

(define (origin-frame frame)
	(car frame))

(define (edge1-frame frame)
	(cadr frame))

(define (edge2-frame frame)
	(cadr (cdr frame)))

;test code 
(define frame  (make-frame 1 2 3))
(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)
;-------------------------------------------------------------
(define (make-frame origin edge1 edge2)
	(cons origin (cons edge1 edge2)))

(define (origin-frame frame)
	(car frame))

(define (edge1-frame frame)
	(cadr frame))

(define (edge2-frame frame)
	(cdr (cdr frame)))

;test code 
(define frame  (make-frame 1 2 3))
(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)
