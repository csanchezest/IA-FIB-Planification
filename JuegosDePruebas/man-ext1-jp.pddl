(define (problem Extension1)
(:domain hotel)
(:objects 
d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dias
A01 A02 A03 A04 A05 - habitacion
R01 R02 R03 R04 R05 R06 - reserva
)

(:init
(= (get-value d1) 1)(= (get-value d2) 2)(= (get-value d3) 3)(= (get-value d4) 4)(= (get-value d5) 5)(= (get-value d6) 6)(= (get-value d7) 7)(= (get-value d8) 8)(= (get-value d9) 9)(= (get-value d10) 10)(= (get-value d11) 11)(= (get-value d12) 12)(= (get-value d13) 13)(= (get-value d14) 14)(= (get-value d15) 15)(= (get-value d16) 16)(= (get-value d17) 17)(= (get-value d18) 18)(= (get-value d19) 19)(= (get-value d20) 20)(= (get-value d21) 21)(= (get-value d22) 22)(= (get-value d23) 23)(= (get-value d24) 24)(= (get-value d25) 25)(= (get-value d26) 26)(= (get-value d27) 27)(= (get-value d28) 28)(= (get-value d29) 29)(= (get-value d30) 30)

(= (total-cost) 0)

(= (init-day R01) 3)
(= (end-day R01) 13)
(= (capacityR R01) 4)

(= (init-day R02) 18)
(= (end-day R02) 22)
(= (capacityR R02) 4)

(= (init-day R03) 24)
(= (end-day R03) 27)
(= (capacityR R03) 3)

(= (init-day R04) 8)
(= (end-day R04) 10)
(= (capacityR R04) 4)

(= (init-day R05) 10)
(= (end-day R05) 10)
(= (capacityR R05) 4)

(= (init-day R06) 24)
(= (end-day R06) 24)
(= (capacityR R06) 3)


(= (capacityH A01) 1)

(= (capacityH A02) 2)

(= (capacityH A03) 2)

(= (capacityH A04) 2)

(= (capacityH A05) 1)

)

(:goal (forall (?r - reserva) (or (reservado ?r) (incompatible ?r))))

(:metric minimize (total-cost))

)
