; Given the following procedures.
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))
    )
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

; Create an integral procedure that uses Simpson's rule.
(define (simpson-integral f a b n) 
    (define h 
        (/ (- b a) (round-up-to-even n))
    )
    (define (simpson-term k)
        (define y
            (f (+ a (* k h)))
        )
        (cond 
            ((= k 0) y)
            ((= k (round-up-to-even n)) y)
            ((even? k) (* 2 y))
            (else (* 4 y))
        )
    )

    (* (/ h 3) (sum simpson-term a incr (round-up-to-even n)))
)

(simpson-integral cube 0 10 10)
; 1/4

(simpson-integral cube 0 10 1000)
; 1/4
