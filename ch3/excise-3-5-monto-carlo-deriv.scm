(define (random-in-range low hight)
  (let ((range (- hight low)))
    (+ low (random range))))

(define (estimate-integral trials x1 x2 y1 y2)
  (/ (* (monte-carlo trials cesaro-test x1 x2 y1 y2) (square (- x2 x1))) (square (/ (- x2 x1) 2))))
(define (cesaro-test x1 x2 y1 y2)
  (let ((x (random-in-range x1 x2))
        (y (random-in-range y1 y2))
        (center_x (/ (+ x1 x2) 2))
        (center_y (/ (+ y1 y2) 2))
        (r (/ (- x2 x1) 2)))
    (>= (square r) (+ (square (- x center_x)) (square (- y center_y))))))
(define (monte-carlo trials experiment x1 x2 y1 y2)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed (* trials 1.0)))
          ((experiment x1 x2 y1 y2)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


;test
(estimate-integral 100000 2.0 8.0 4.0 10.0)
