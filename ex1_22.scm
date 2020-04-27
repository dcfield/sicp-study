; Given a range of numbers, check if there exist 3 consecutive odd primes in that range.

; NOTE: The following is my first attempt. See bottom of page *** for final working attempt.
; Taken from 1.2.6
(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (divides? a b)
    (= (remainder b a) 0)
)

(define (prime? num)
    (= num (smallest-divisor num))
)

(define (return-prime n)
    (
    if (prime? n)
        n
        0
    )
)

; This was my first attempt.
; Something I have forgotten since studying maths in university - ALWAYS READ THE QUESTION!!!
; The question has asked to find 3 consecutive primes in a given range - it does not say to ONLY find 3 consecutive primes in a given range.
(define (search-for-primes start finish)
    (define (search-for-primes-count start finish count)
        ; Given a number n
        ; If it is prime, check the next 2 numbers
        ; If they are prime, return them
        ; If not prime, return 0
        (cond
            ; If range is finished, return 0
            ((= start finish) 0)

            ; If count=2, return prime number
            ((= count 2) start)

            ; If number is prime, check the next odd number
            ((prime? start)
                start
            )

            (else (search-for-primes-count (+ start 2) finish 0))
        )
    )

    (
    if (even? start)
        (search-for-primes-count start finish 0)
        (search-for-primes-count (+ start 1) finish 0)
    )
)


; The below code gives the question in complete - copy and paste directly from this point onwards.
; Ex1.22 ***
  
(define (square x) (* x x)) 
  
(define (smallest-divisor n)
  (find-divisor n 2)) 
  
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
    ((divides? test-divisor n) test-divisor) 
    (else (find-divisor n (+ test-divisor 1))))) 
  
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
