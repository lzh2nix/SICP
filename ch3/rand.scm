(define random-init 1)
(define (rand-update x)
  (let ((a 1461169)
        (b 643919)
        (m 2757917))
    (modulo (+ (* a x) b) m)))
(define rand
  (let ((x random-init))
    (lambda () (set! x (rand-update x)) x)))

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))
(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

(define (random-in-range low hight)
  (let ((range (- hight low)))
    (+ low (random range))))

(define (estimate-integral x1 x2 y1 y2 trials)
  (monte-carlo trials (cesaro-test-1 x1 x2 y1 y2)))
(define (cesaro-test-1 x1 x2 y1 y2)
  (let ((x (random-in-range x1 x2))
        (y (random-in-range y1 y2))
        (center_x (/ (+ x1 x2) 2))
        (center_y (/ (+ y1 y2) 2))
        (r (/ (- x2 x1) 2)))
    (>= (square r) (+ (square (- x center_x)) (square (- y center_y))))))
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


;test
(estimate-pi 100000)
(estimate-integral 2 8 4 10 100000)
