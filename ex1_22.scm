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

; Part II Question
; Use your procedure to find the three smallest primes larger than 1000
; larger than 10,000
; larger than 100,000
; larger than 1,000,000. 
; Note the time needed to test each prime. 
; Since the testing algorithm has order of growth of Θ(root(n)), 
; you should expect that testing for primes around 10,000 
; should take about root(10) times as long as testing for primes around 1000. 
; Do your timing data bear this out?

; Part II timings calculations
; root(10) ~ 3.16
; First, get timings of smallest primes larger than 1000.

(search-for-primes 1000 1100)
; 1009 *** 0.
; 1013 *** 0.
; 1019 *** 0.
; Too small - let's try some much bigger numbers.

(search-for-primes 100000000000 100000000100)
; 100000000003 *** .45999999999999996
; 100000000019 *** .4800000000000004
; 100000000057 *** .4599999999999991

; Before doing a calculation of a range bigger by a factor of 10, let's estimate the timings.
; Prime 1 should equal (.45 * 3.16) ~ 1.42s
; Prime 2 should equal (.48 * 3.16) ~ 1.52s
; Prime 3 should equal (.46 * 3.16) ~ 1.45s

; Let's test!
(search-for-primes 1000000000000 1000000000100)
; 1000000000039 *** 1.4600000000000009
; 1000000000061 *** 1.4700000000000006
; 1000000000063 *** 1.4699999999999989
; Not far off!
