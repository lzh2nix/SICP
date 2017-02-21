(define size 2)
;Value: size
(* 5 size)

(define PI 3.1415925)

(define radius 10)

(* pi (* radius radius))
;Value: 314.15925

(* (+ 2 (* 4 6))
   (+ 3 5 7))
;Value: 390

(define (square x) (* x x))
;Value: square

(square 2)
;Value: 4

(define (sum-of-square x y)
  (+ (square x) (square y)))
;Value: sum-of-square

(sum-of-square 3 4)
;Value: 25

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) x)
	((< x 0) (- x))))
  
;Value: abs

(abs (- 10))
;Value: 10

(define (abs x)
  (cond ((>= x 0) x)
	(else (- x))))
;Value: abs

(abs (- 10))
;Value: 10

(define (abs x)
  (if (>= x 0)
      x
      (- x)))
;Value: abs

(abs (- 10))
;Value: 10

;;excise 1.2
(/ (+ 5 4 (- 2
	     (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
;Value: -37/150

;;excise 1.3
(define (max x y)
  (if (> x y)
      x
      y))
;Value: max

(define (min x y)
  (if (< x y)
      x
      y))
;Value: min

(define (sum-of-two-max x y z)
  (- (+ x y z)
     (min (min (min x y) (min x z)) (min y z))))
;Value: sum-of-two-max

(sum-of-two-max 1 3 3)
;Value: 6
(sum-of-two-max 3 3 3)

					;Value: 6

(define (p) (p))
;Value: p

(sum-of-square 2 3)
;Value: 13

;;excise 1.5
;; if (test 0 (p)) can be evaluate this should be a application order
;; otherwise it's a regular order
(define (test x y)
  (if (= x 0)
      x
      y))
;Value: test
(test 0 (p))


(define (good-enough? guess x)
  (< (abs(- (square guess) x)) 0.001))
;Value: good-enough?


(good-enough? 2 4)
;Value: #t

;The object 2 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify a procedure to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.

(define (improve-guess guess x)
  (/ (+ guess (/ x guess)) 2))
;Value: improve-guess
;Value: improve-guess


(improve-guess 1 2)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve-guess guess x) x)))
;Value: sqrt-iter
(sqrt-iter 1 2)

;Value: 577/408
(define (sqrt-of-root x)
  (sqrt-iter 1.0 x))
;Value: sqrt-of-root

(sqrt-of-root 2)
;Value: 1.4142156862745097

;;excise 1.6
;;in application order case,if we call new-if then
;;we calcuate the (good-enought guess x) and (sqrt-iter)
;;the this iter will never end

;;excise 1.7
(define (good-enough? guess x)
  (< (abs (- (improve-guess guess x)
	     (improve-guess (improve-guess guess x) x)))
     0.000001))
;Value: good-enough?



(good-enough? 1.4142156862745097 2)
;Value: #t

(sqrt-of-root (* 10000000 10000000))

;; excise 1.8
(define (improve-guess guess x)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))
;Value: improve-guess
(improve-guess 1 8)
;Value: 10/3

(define (good-enough? guess x)
  (< (abs (- (improve-guess guess x)
	     (improve-guess (improve-guess guess x) x)))
     0.000001))
(good-enough? 2 8)
;Value: #t
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve-guess guess x) x)))
;Value: cube-root-iter

(cube-root-iter 1.0 100)
;Value: 2.000004911675504
;Value: 4.641590111046459
;Value: 4.641590111046459
(* 4.64 4.64 4.64)
;Value: 99.89734399999999
(define (cube-of-root x)
  (define (improve-guess guess)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))
  (define (good-enough? guess)
  (< (abs (- (improve-guess guess)
	     (improve-guess (improve-guess guess))))
     0.0000000001))

  (define (cube-root-iter guess)
  (if (good-enough? guess)
      guess
      (cube-root-iter (improve-guess guess))))

  (cube-root-iter 1.0))
;Value: cube-of-root

(cube-of-root 8)
;Value: 2.000004911675504

(cube-of-root 100)
;Value: 4.641590111046459

(cube-of-root 125)
;Value: 5.00003794283566





