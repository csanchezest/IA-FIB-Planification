(define (domain aeropuerto1)
  (:requirements :adl :typing)
  (:types avion lugar - object
          pista puerta aire - lugar)           
  (:predicates
   (en ?avion - avion ?lugar - lugar)
   (salida ?avion - avion)
   (libre ?l - lugar)
   (servido ?avion - avion)
  )

  (:action ir_a_pista
    :parameters (?av - avion ?pemb - puerta ?pst - pista )
    :precondition (and (en ?av ?pemb) (salida ?av) 
                       (libre ?pst)
                   )    
    :effect (and (en ?av ?pst) (not (en ?av ?pemb))
                 (libre ?pemb) (not (libre ?pst))
            )
   )

   (:action despegar
    :parameters (?av - avion ?pst - pista ?ai - aire)
    :precondition (and (en ?av ?pst) (salida ?av) )
    :effect (and (en ?av ?ai) (not (en ?av ?pst)) 
                 (libre ?pst) (servido ?av) 
            )
  )
  
  (:action aterrizar
    :parameters (?av - avion ?ai - aire ?pst - pista)
    :precondition (and (en ?av ?ai) (not (salida ?av)) 
                       (libre ?pst)
                  )
    :effect (and (en ?av ?pst) (not(en ?av ?ai))  
                 (not (libre ?pst))
            )
  )
   
  (:action ir_a_puerta_embarque
    :parameters (?av - avion ?pst - pista ?pemb - puerta )
    :precondition (and (en ?av ?pst) (not (salida ?av))  
                       (libre ?pemb) 
                  )
    :effect (and (en ?av ?pemb) (not (en ?av ?pst))  
                 (libre ?pst) (not (libre ?pemb)) (servido ?av)
                  )
   )
   
)

