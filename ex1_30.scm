; Rewrite sum procedure from Ch 1.3.1 so that it is performed iteratively.

;; sum-iter procedure
(define (sum-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))
        )
    )
    (iter a 0)
)

(define (cube x)
    (* x x x)
)

(define (incr x)
    (+ x 1)
)

(define (round-up-to-even x)
    ; Only use nearest even number.
    (+ x (remainder x 2))
)

(simpson-integral cube 0 1 100)
; 1/4
