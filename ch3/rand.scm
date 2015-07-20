(define random-init 1)
(define (rand-update x)
  (let ((a 1461169)
        (b 643919)
        (m 2757917))
    (modulo (+ (* a x) b) m)))
(define rand
  (let ((x random-init))
    (lambda () (set! x (rand-update x)) x)))
