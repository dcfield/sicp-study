; ex1.17

; First, define double and halve procedures.
(define (double x)
    (+ x x)
)

(define (halve y)
    (/ y 2)
)

; First four parts of conditional take care of basic cases.
; The interesting part is the 'else' statement.
; As an example, in math notation, (4 * 3) = 4 + (3 * 3)
(define (* a b)
    (cond
        ((= b 0) 0)
        ((= a 0) 0)
        ((= b 1) a)
        ((= a 1) b)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))
    )
)
