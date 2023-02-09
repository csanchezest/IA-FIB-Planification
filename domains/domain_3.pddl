(define (domain hotel)
  (:requirements 
      :adl 
      :typing
      :fluents
      :strips
  )
  (:types 
      habitacion reserva dias  - object
  )
  (:functions 
      (capacityH ?h - habitacion)
      (capacityR ?r - reserva)
      (init-day ?r - reserva)
      (end-day ?r - reserva)
      (get-value ?d - dias)
      (total-cost)
  )
  (:predicates
      (reservado ?r - reserva) ;; asignacion de reserva
      (incompatible ?r - reserva)
      (ocupado ?h - habitacion ?d - dias) ;; explicar tesitura de espacio vs tiempo (ocupado vs libre)
  )  
  (:action reservar-habitacion
    :parameters (?h - habitacion ?r - reserva)
    :precondition (and (not(reservado ?r)) 
                     (>= (capacityH ?h) (capacityR ?r))
                     (forall (?d - dias) (imply (and (>= (get-value ?d) (init-day ?r)) (<= (get-value ?d) (end-day ?r))) (not (ocupado ?h ?d))))
                  )
    :effect (and 
                (forall (?d - dias)
                    (when(and(>= (get-value ?d) (init-day ?r)) (<= (get-value ?d) (end-day ?r))) 
                        (ocupado ?h ?d))
                )
                (reservado ?r)
                (increase (total-cost) (- (capacityH ?h) (capacityR ?r)))
            )
   )
   (:action descarte-reserva
    :parameters (?r - reserva)
    :precondition (and 
                     (not(reservado ?r)) 
                     (forall (?h - habitacion) 
                        (or (< (capacityH ?h) (capacityR ?r))
                        (exists (?d - dias) (and (>= (get-value ?d) (init-day ?r)) (<= (get-value ?d) (end-day ?r)) (ocupado ?h ?d)))
                        )
                     )
                  )
    :effect (and
                (incompatible ?r)
                (increase (total-cost) 5)
            )
   )
)

