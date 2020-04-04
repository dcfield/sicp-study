; f(n) = n if n < 3
; f(n) = f(n - 1) + 2f(n-2) + 3(n-3) if n >= 3
; Write a procedure witih recursive & iterative process.

; Recursive
; Since the state can be saved via recursive process, this is straight forward.
(define (f n)
    (
    if (< n 3)
        n
        (+
            (f (- n 1))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))
        )
    )
)

; Iterative
; The iterative part was more difficult to understand.
; Let x = n-1, y = n-2, z = n-3.
; Then f(n) = f(x) + 2f(y) + 3f(z).
; Let the first iteration be n, then n-1, then n-2 ... until 0
; The iterative procedure needs to track all states at all times (unlike recursive).

(define (fi n)
  (if (< n 3)
    n
    (f-iter 2 1 0 n)
  )
)

(define (f-iter x y z counter)
  (if (< counter 3)
    x
    (f-iter (+ x (* 2 y) (* 3 z))
      x
      y
      (- counter 1)
    )
  )
)

; f(n) tests
(= (f 2) 2)
(= (f 4) 11)

; fi(n) tests
(= (fi 2) 2)
(= (fi 4) 11)

; compare
(= (f 2) (fi 2))
(= (f 4) (fi 4))
