;; Ex1.36 
; Modify fixed-point so that it prints the approximations.
; Find a solution to x^x=1000 by finding a fixed point (x) => log(1000)/log(x).
; Compare the number of steps with and without average damping.

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
        tolerance)
    )
    (define (try guess)
        (display guess)
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next)
            )
        )
    )
    (try first-guess)
)

(define (golden x)
    (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
)

(define (no-damper-printer x)
    (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
)

(define (damper-printer x)
    (fixed-point (lambda (x) (/ (+ (log x) (/ (log 1000) (log x))) 2)) 2.0)
)

(no-damper-printer 1000)
(damper-printer 1000)
