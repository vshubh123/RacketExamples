; Michael Marona
; 24/6/2014
; bin.rkt : Provides a function that will convert flonums, and integers into a binary representation

; Example (decimal->binary 5 1) -> 101
; Example (decimal->binary 5.75 3) -> 101.110
; Example (decimal->binary -5.75 2) -> -101.11

#lang racket/base

(require racket/flonum racket/list racket/contract)

(provide (contract-out
			[decimal->binary (->* ((and/c number? real?))
								  ((and/c number? exact-integer? positive? (not/c zero?)))
								  any/c)]))

(define (decimal->binary num [num-dec-digits 14])

	; decimal-num will be called only if num is a flonum
	;
	; Given a number 0 < num < 1, it will return a binary representation
	; of the floating point number up to num-dec-digits bits of accuracy
	; as a list
	(define (decimal-num dnum count)

		(cond
			; The proper number of digits has been reached.
			; End the list with empty
			[(= count num-dec-digits) empty]

			; If the power of two is not in the binary representation, append 0 and continue
			[(< (- dnum (expt 2 (- count))) 0) (cons 0 (decimal-num dnum (add1 count)))]

			; If the power of two is in the binary representation, append 1 and continue
			[else (cons 1 (decimal-num (- dnum (expt 2 (- count))) (add1 count)))]))

	; Calculates the binary respresentation
	(define (calculate toCalculate)

		(cond

		; If the number is negative, print a minus, and recalculate as a positive number
		[(negative? toCalculate) (printf "-")
						 (calculate (- toCalculate) num-dec-digits)]

		; If the number is an integer, simply print out the binary representation
		[(exact-integer? toCalculate) (printf "~b\n" toCalculate)]

		; If the number is floating point, print the whole number, then create a list of
		; num-dec-digits, which is converted to a string, then printed out
		[(flonum? toCalculate)
		 (printf "~b.~a\n"
				 (fl->exact-integer (truncate toCalculate))
				 (list->string
				 	(map (lambda (x) (integer->char (+ x 48)))
					   	 (decimal-num (- toCalculate (fl->exact-integer (truncate toCalculate))) 1))))]))

	(calculate num))