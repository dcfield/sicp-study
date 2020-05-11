;; Ex1.35
; Show that golden ratio = 1.6180 is a fixed point of (x) => (1 + 1/x)
; Compute golden ratio by fixed point procedure.

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
        tolerance)
    )
    (define (try guess)
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

(golden 3)
; Value: 1.6180327868852458
