(define (make-queue) (cons '() '()))

(define (front-ptr queue)
  (car queue))

(define (rear-ptr queue)
  (cdr queue))

(define (set-front-ptr! queue item)
  (set-car! queue item))

(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "this is a emtpy queue")
      (car (front-ptr queue))))

(define (insert-queue queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))
(define (print-queue queue)
  (front-ptr queue))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "delete from empty queue"))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))
;test
(define Q (make-queue))
(insert-queue Q 1)
(insert-queue Q 2)
(insert-queue Q 3)
(insert-queue Q 4)
(insert-queue Q 5)
(delete-queue! Q)
(print-queue Q)
