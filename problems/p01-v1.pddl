; Overcooked v1

(define (problem overcooked-ensalada-test)
 (:domain overcooked_v1)
 (:objects
  cocinero-1 - cocinero

  encimera-1 - encimera
  encimera-2 - encimera
  encimera-3 - encimera

  tabla-1 - tablaCorte

  fregadero-1 - fregadero

  plato-1 - plato

  lechuga-1 - lechuga
  tomate-1 - tomate
 )
 (:init
  (cocinero-en cocinero-1 fregadero-1)
  (mano-libre cocinero-1)

  (en plato-1 encimera-1)
  
  (libre tabla-1)
  (libre fregadero-1)


  (en lechuga-1 encimera-2)
  (en tomate-1 encimera-3)


 )
 (:goal (and
  (cortado lechuga-1)
  (cortado tomate-1)
  (enplatado lechuga-1 plato-1)
  (enplatado tomate-1 plato-1)
 ))
)
