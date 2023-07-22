(define (my-filter pred lst)
  (cond
          ((null? lst) lst)
          ((pred (car lst))(cons (car lst) (my-filter pred (cdr lst))))
          (else (my-filter pred (cdr lst)))
          )
  )

(define (interleave s1 s2)
  (cond
        ((null? s1) s2)
        ((null? s2) s1)
        (else (cons
                  (car s1)
                  (cons
                      (car s2)
                      (interleave
                          (cdr s1)
                          (cdr s2))
                      )
                  ))
        )
  )

(define (accumulate joiner start n term)
  (if
        (= n 0)
        start
        (accumulate
            joiner
            (joiner
                    start
                    (term n))
            (- n 1)
            term
            )))

(define (no-repeats lst)
  (if
        (null? lst)
        lst
        (cons
            (car lst)
            (no-repeats
                (my-filter
                    (lambda (x) (not (= x (car lst))))
                    (cdr lst)))
            )
        )
  )
