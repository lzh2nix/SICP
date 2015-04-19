(define (matrix2vector matrix)
	(if (null? (cdr matrix))
		(car matrix)
		(append (car matrix) (matrix2vector (cdr matrix)))))

(define (dot-product v w)
	(accumulate + 0 (map * v w)))
; ti = sum(m(ij)v(j))
(define (matrix-*-vector m v)
	(map (lambda (x) (dot-product v x)) m))


(define (accumulate op initial sequence)
   (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
   (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (transpose m)
	(accumulate-n cons '() m))

(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		(map (lambda (x) (matrix-*-vector cols x)) m)))

;test code 
(matrix-*-vector (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) (list 1 2 3))

(dot-product (list 1 2 3) (list 4 5 6))

(transpose (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))

(matrix-*-matrix (list (list 1 2) (list 3 4) (list 5 6) (list 7 8)) (list (list 1 2 3) (list 4 5 6)))
