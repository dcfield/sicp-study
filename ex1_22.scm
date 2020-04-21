
; Given a range of numbers, check if there exist 3 consecutive odd primes in that range.

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



(define (search start finish)

    ; Given a number n
    ; If it is prime, check the next 2 numbers
    ; If they are prime, return them
    ; If not prime, return 0
    (cond
        ; If even, skip
        ((= 0 (remainder start 2)) (search (+ start 1) finish))

        ; If range is finished, return 0
        ((= start finish) 0)

        ; If number is prime, check the next 2 odd numbers
        ((prime? start) 
            (consec? start)
        )
        (else (search (+ start 1) finish))
    )
)

; Check if n+2 and n+4 are prime
(define (consec? n)
    (
    if (prime? (+ n 2))
        (prime? (+ n 4))
        (#f)
    )
)







