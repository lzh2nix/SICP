(define (make-accumulator base)
  (lambda (acc)
    (begin (set! base (+ base acc))
           base)))

;test
(define A (make-accumulator 5))
(A 10)
(A 15)
