; Pascal's triangle exercise.
; Write a procedure that computes elements of Pascal's triangle by a recursive process.
; 1
; 1 1
; 1 2 1
; 1 3 3 1

; NOTES
; Since the question asks to compute 'elements', let's assume that it means the following:
; Given a column and row number, computer the Pascal triangle value.
; Inputs: col_num, row_num
; Output: Value

; If row_num or col_num is 1, return 1 (see the triangle diagram above).
; If row_num == col_num, then we are at the rightmost value in the row, which is always 1.
; For any other value given, we calculate the two values in the triangle that are above the given location.
; For example
; Given row_num = 3 , col_num = 2, we calculate 
; (row 2, col 1) + (row 2, col 2).

; To generalize this, given f(x,y) where col_num = x, row_num = y.
; Ans = f(x-1, y-1) + f(x-1, y)

(define (pascal row_num col_num)
    (cond 
        ((= row_num 1) 1)
        ((= col_num 1) 1)
        ((= row_num col_num) 1)
        (else 
            (+ 
                (pascal (- row_num 1) (- col_num 1))
                (pascal (- row_num 1) col_num)
            )
        )
    )
)
