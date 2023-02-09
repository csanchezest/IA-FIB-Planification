(define (problem test-reservas)
    (:domain hotel)
    (:objects 
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dias
    A01 A02 - habitacion
    R01 R02  - reserva
    )


    (:init
    (= (get-value d1) 1) (= (get-value d2) 2) (= (get-value d3) 3) (= (get-value d4) 4) (= (get-value d5) 5) (= (get-value d6) 6) (= (get-value d7) 7) (= (get-value d8) 8) (= (get-value d9) 9) (= (get-value d10) 10) (= (get-value d11) 11) (= (get-value d12) 12) (= (get-value d13) 13) (= (get-value d14) 14) (= (get-value d15) 15) (= (get-value d16) 16) (= (get-value d17) 17) (= (get-value d18) 18) (= (get-value d19) 19) (= (get-value d20) 20) (= (get-value d21) 21) (= (get-value d22) 22) (= (get-value d23) 23) (= (get-value d24) 24) (= (get-value d25) 25) (= (get-value d26) 26) (= (get-value d27) 27) (= (get-value d28) 28) (= (get-value d29) 29) (= (get-value d30) 30)
    
    (= (total-cost) 0)
    
    (= (init-day R01) 1)
    (= (end-day R01) 2)
    
    (= (init-day R02) 3)
    (= (end-day R02) 4)
    
    (= (capacityH A01) 4)
    (= (capacityH A02) 4)
    
    (= (capacityR R01) 3)
    (= (capacityR R02) 3)
    
    ;; N - 10   O - 20  S - 30  E - 40
    
    (= (get-orientacion A01) 10)
    (= (get-orientacion A02) 30)
    
    (= (get-preferencia R01) 10)
    (= (get-preferencia R02) 30)
    
    )

    (:goal (forall (?r - reserva) (or (reservado ?r) (incompatible ?r))))
    
    (:metric minimize (total-cost))
    
)

