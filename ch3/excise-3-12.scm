(define A (cons 1 2))
(set-car! A 3)
(set-cdr! A 3)
(define x (list '(a b) 'c 'd))
(define y '(e f))

(define z (cons y (cdr  x)))

(define (append set a)
  (if (null? set)
      a
      (cons (car set) (append (cdr set) a))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
(define (append! set a)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair set)
  (if (null? (cdr set))
      set
      (last-pair (cdr set))))
(define w (append! x y))
(cdr w)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define z (make-cycle (list 'a 'b 'c)))


;for 3.14
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))
(define w (mystery v))

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))
(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

(set-to-wow! z1)
(set-to-wow! z2)


;excise 3.15
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define (in-list? ele list)
  (cond ((null? list) #f)
        ((eq? ele (car list)) #t)
        (else
         (in-list? ele (cdr list)))))
(define (count-pairs x)
  (define (count-pairs-iter x result pairs)
    (if (null? x)
        result
        (let ((first (car x)))
          (if (and (pair? first) (not (in-list? first pairs)))
              (count-pairs-iter (cdr x) (+ 1 result) (cons first pairs))
              (count-pairs-iter (cdr x) result pairs)))))
  (count-pairs-iter x 0 '()))

(define list-1 (list (cons 'a 'b) (cons 'c 'd) (cons  'e 'f)))
(count-pairs list-1)
(define list-2 (list (cons 'a 'b) (cons 'c 'd) (cons  'e 'f) 'g 'h))
(count-pairs list-2)
(define list-3 (make-cycle list-1))
(count-pairs list-3)

(define (cycle-test list)
  (let ((first (car list)))
    (define (cycle-test-iter rest)
      (cond ((null? (cdr rest)) #f)
            ((eq? first (car (cdr rest))) #t)
            (else
             (cycle-test-iter (cdr rest)))))
  (cycle-test-iter list)))

(cycle-test z)
