;; Overcooked V1 sequential
;;

(define (domain overcooked_v1)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types
        location locatable cocinero - object
        encimera fogon tablaCorte fregadero - location
        plato ingrediente - locatable
        lechuga tomate bacon banana carne frambuesa pan zanahoria queso pollo chocolate pepinillo masa pescado harina champinion nori piña patata arroz salchicha fresa gamba tortilla sandia - ingrediente
  )

  (:predicates 
     (en ?x - locatable ?l - location)
     (enplatado ?i - ingrediente ?p - plato)
     (libre ?l - location)
     (cortado ?c - ingrediente)
     (lavado ?p - plato)
     (cocinero-en ?coc - cocinero ?loc - location)
     (cocinero-lleva ?coc - cocinero ?lbl - locatable)
     (mano-libre ?coc - cocinero)
  )

;; Reglas
;; Lavar alimento
;; Cortar alimento
;; Mover algo de un lugar a otro
;; Cocinar 
;; Enplatar
;; 


(:action verter
    :parameters (?e - encimera ?p - plato ?coc - cocinero ?i - ingrediente)
    :precondition (and
        (lavado ?p)
        (en ?p ?e)
        (cocinero-en ?coc ?e)
        (cocinero-lleva ?coc ?i)
    )
    :effect (and
        (mano-libre ?coc)
        (not (cocinero-lleva ?coc ?i))
        (enplatado ?i ?p)
    )
)

(:action cortar
    :parameters (?c - ingrediente ?t - tablaCorte ?l1 - location ?coc - cocinero)
    :precondition (and
        (mano-libre ?coc)
        (not (cortado ?c))
        (cocinero-en ?coc ?t)
        (en ?c ?t)
      )
    :effect (and
        (cortado ?c)
      )
  )

(:action lavar
    :parameters (?p - plato ?l - fregadero ?coc - cocinero)
    :precondition (and
        (mano-libre ?coc)
        (cocinero-en ?coc ?l)
        (en ?p ?l)
        (not (lavado ?p))
      )
    :effect (and
        (lavado ?p)
      )
  )

(:action mover
    :parameters (?l1 ?l2 - location ?coc - cocinero)
    :precondition (and
        (cocinero-en ?coc ?l1)
    )
    :effect (and
        (not (cocinero-en ?coc ?l1))
        (cocinero-en ?coc ?l2)
    )
)

(:action coger
    :parameters (?lbl - locatable ?l1 - location ?coc - cocinero)
    :precondition (and
        (mano-libre ?coc)
        (cocinero-en ?coc ?l1)
        (en ?lbl ?l1)
      )
    :effect (and
        (libre ?l1)
        (not (mano-libre ?coc))
        (not (en ?lbl ?l1 ))
        (cocinero-lleva ?coc ?lbl)
      )
  )

(:action dejar
    :parameters (?lbl - locatable ?l1 - location ?coc - cocinero)
    :precondition (and
        (libre ?l1)
        (cocinero-en ?coc ?l1)
        (cocinero-lleva ?coc ?lbl)
      )
    :effect (and
        (not (libre ?l1))
        (mano-libre ?coc)
        (not (cocinero-lleva ?coc ?lbl))
        (en ?lbl ?l1)
      )
  )
)