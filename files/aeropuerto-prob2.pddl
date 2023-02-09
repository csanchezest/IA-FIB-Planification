(define (problem aeropuertos-2pistas5puertas8aviones)
   (:domain aeropuerto1)
   (:objects IB0121 VY0256 KL0333 LH4044 IB0051 BA6136 AF0700 AL8860 - avion
             A1 A2 B1 B2 B3 - puerta
             ps1 ps2 - pista
             air - aire
    )


(:init
  (en IB0121 air)
  (en VY0256 air)
  (en KL0333 air)
  (en LH4044 air)
  (en IB0051 A1) (salida IB0051)
  (en BA6136 B1) (salida BA6136)
  (en AF0700 B2) (salida AF0700)
  (en AL8860 B3) (salida AL8860)
  (libre A2)
  (libre ps1)
)


(:goal (forall (?av - avion) (servido ?av)))
)


