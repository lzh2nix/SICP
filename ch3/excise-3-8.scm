(define (make-f value)
  (lambda (x)
    (set! value x)))

(define f (make-f 0))

(+ (f 0) (f 1))
(+ (f 1) (f 0))
