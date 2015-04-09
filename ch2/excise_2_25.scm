(define seven 7)

;(1 3 (5 7) 9)
(define x (cons 1 (cons 3 (cons (cons 5 (cons 7 '())) (cons 9 '())))))
(eq? seven (car (cdr (car (cdr (cdr x))))))

;((7))
(define y (cons (cons 7 '()) '()))
(eq? seven (car (car y)))

;(1 (2 (3 (4 (5 (6 7))))))
(define z (cons 1 (cons (cons 2 (cons (cons 3 (cons (cons 4 (cons (cons 5 (cons (cons 6 (cons 7 '())) '())) '())) '())) '())) '())))
(eq? seven (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z)))))))))))))
