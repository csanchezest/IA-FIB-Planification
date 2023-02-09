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
  )
  (:predicates
      (reservado ?r - reserva) ;; asignacion de reserva
      (ocupado ?h - habitacion ?d - dias) ;; explicar tesitura de espacio vs tiempo (ocupado vs libre)
  )  
  (:action reservar_habitacion
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
            )
   )
)
