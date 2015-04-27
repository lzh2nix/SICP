(define (accumulate op initial sequence)
   (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
   (cond ((null? sequence) '())
         ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
         (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
   (if (> low high)
      '()
      (cons low (enumerate-interval (+ 1 low) high))))

(define (flatmap proc seq)
   (accumulate append '() (map proc seq)))

(define empty_bord '())
(define (adjoin-position new-row k rest-of-queens)
	(cons new-row rest-of-queens))

(define (not-in-line item seq)
	(cond ((null? seq) #t)
			((= item (car seq)) #f)
			(else (not-in-line item (cdr seq)))))
(define (not-in-left-down item seq)
	(cond ((null? seq) #t)
	      ((= item (car seq)) #f)
	      (else (not-in-left-down (- item 1) (cdr seq)))))

(define (not-in-right-down item seq)
	(cond ((null? seq) #t)
	      ((= item (car seq)) #f)
	      (else (not-in-right-down (+ item 1) (cdr seq)))))
(define (safe? k positions)
	(let ((kth (car positions))
			(rest (cdr positions)))
		(and (not-in-line kth rest)
			  (not-in-left-down (- kth 1) rest)
			  (not-in-right-down (+ kth 1) rest))))

(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty_bord)
			(filter
				(lambda (positions) (safe? k positions))
				(flatmap 
					(lambda (rest-of-queens)
						(map (lambda (new-row)
								(adjoin-position new-row k rest-of-queens))
							  (enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
	(queen-cols board-size))

;test code
;n:	1	2	3	4	5	6	7	8	9		10
;all:	1	0	0	2	10	4	40	92	352	724	
(= (length (queens 1 )) 1)
(= (length (queens 2 )) 0)
(= (length (queens 3 )) 0)
(= (length (queens 4 )) 2)
(= (length (queens 5 )) 10)
(= (length (queens 6 )) 4)
(= (length (queens 7 )) 40)
(= (length (queens 8 )) 92)
