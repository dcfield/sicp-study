;; ex 1.34
; Suppose we define the procedure
(define (f g) (g 2))

; Then we have
(f square)
; 4

(f (lambda (z) (* z (+ z 1))))
; 6

; What happens if we (perversely) ask the interpreter to evaluate the following combination. Explain.
(f f)
;  ^ Pass in for g giving (f 2).

; First, it will pass in f for the g value, so it will result in the following:
(f 2)
;  ^ Pass in for g giving (2 2).

; Then, it will pass in 2 for the g value, resulting in:
(2 2)

; Errors out.
