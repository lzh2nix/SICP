(define (square n)
  (* n n))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (f n)
  (sum-of-square (+ n 1) (* n 2)))

(define (factorial n)
  (if (=  n)
      1
      (* n (factorial (- n 1)))))

(define (factorial-1 n)
  (factorial-iter 1 1 n))
(define (factorial-iter product count max-count)
  (if (> count max-count)
      product
      (factorial-iter (* product count)
                      (+ count 1)
                      max-count)))

(define (make-withdraw init-value)
  (let ((balance init-value))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          (error "Insufficient funds")))))
;test
(define W1 (make-withdraw 100))
(W1 50)

(define make-withdraw-1
  (lambda (balance)
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          (error "Insufficient funds")))))

(define W1 (make-withdraw-1 100))
(W1 50)
