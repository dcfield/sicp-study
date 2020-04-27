; Ex1.23
; Create 'next' procedure.
(define (next test-divisor)
    (cond ((= test-divisor 2) 3)
        (else (+ test-divisor 2))
    )
)

; Modify 'find-divisor' to use 'next' instead of increment the test-divisor.
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
    ((divides? test-divisor n) test-divisor) 
    (else (find-divisor n (next test-divisor))))) 
  
(define (square x) (* x x)) 
  
(define (smallest-divisor n)
  (find-divisor n 2)) 
  
(define (divides? a b) 
  (= (remainder b a) 0)) 
  
(define (prime? n) 
  (= n (smallest-divisor n))) 
  
(define (timed-prime-test n) 
  (start-prime-test n (runtime))) 
  
(define (start-prime-test n start-time) 
  (if (prime? n) 
    (report-prime n (- (runtime) start-time)))) 
  
(define (report-prime n elapsed-time) 
  (newline) 
  (display n) 
  (display " *** ") 
  (display elapsed-time)) 
  
(define (search-for-primes start finish) 
  (define (iter n) 
    (cond (
      (<= n finish) (timed-prime-test n) 
      (iter (+ n 2))
      )
    )
  ) 
  (iter (if (odd? start) start (+ start 1)))
)


; These should run about twice as fast as primes in Ex1_22
; Ex1_22 
; 1000000000039 *** 1.4600000000000009
; This should now take ~ .7s

(search-for-primes 1000000000000 1000000000040)
; 1000000000039 *** .8699999999999974
; Much faster!
