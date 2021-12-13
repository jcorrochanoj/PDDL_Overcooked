;; Overcooked V1 sequential
;;

(define (domain overcooked_v1)
  (:requirements :typing :action-costs)
  (:types
        location locatable - object
        encimera vitro armario tablaCorte fregadero - location
        sarten plato consumible - locatable
        patata cebolla aceite - consumible
        stock-number - object
  )

  (:predicates 
     (en ?x - locatable ?l - location)
     (cortado ?c - consumible)
     (lavado ?c - consumible)
     (cocinero-en ?loc - location)
     (cocinero-lleva ?lbl - locatable)
  )

;; Reglas
;; Lavar alimento
;; Cortar alimento
;; Mover algo de un lugar a otro
;; Cocinar 
;; Enplatar
;; 


(:action mover
    :parameters (?l1 ?l2 - location)
    :precondition (and
        (cocinero-en ?l1)
      )
    :effect (and
        (not (cocinero-en ?l1))
        (cocinero-en ?l2)
      )
  )

(:action coger
    :parameters (?lbl - locatable ?l1 - location)
    :precondition (and
        (cocinero-en ?l1)
        (en ?lbl - locatable ?l1 - location)
      )
    :effect (and
        (not (en ?lbl - locatable ?l1 - location))
        (cocinero-lleva ?lbl)
      )
  )

(:action dejar
    :parameters (?lbl - locatable ?l1 - location)
    :precondition (and
        (cocinero-en ?l1)
        (cocinero-lleva ?lbl)
      )
    :effect (and
        (not (cocinero-lleva ?lbl))
        (en ?lbl - locatable ?l1 - location)
      )
  )

(:action lavar
    :parameters (?c - consumible ?l - fregadero)
    :precondition (and
        (cocinero-en ?l)
        (cocinero-lleva ?c)
      )
    :effect (and
        (lavado ?c)
      )
  )

(:action cortar
    :parameters (?c - consumible ?l - tablaCorte)
    :precondition (and
        (lavado ?c)
        (cocinero-en ?l)
        (cocinero-lleva ?c)
      )
    :effect (and
        (cortado ?c)
      )
  )

(:action cocinar
    :parameters (?c - consumible ?l - vitro ?s - sarten)
    :precondition (and
        (lavado ?c)
        (cocinero-en ?l)
        (cocinero-lleva ?c)
        (en ?s ?l)
      )
    :effect (and
        (cocinado ?c)
      )
  )