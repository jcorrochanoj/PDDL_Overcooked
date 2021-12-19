;; Overcooked V1 sequential
;;

(define (domain overcooked_v1)
    (:requirements :typing :negative-preconditions :equality)
    (:types
        util ingrediente cocinero zona localizacion - object
        lechuga tomate pepino pescado gamba patata masa champinion alga bacon banana carne frambuesa pan zanahoria queso pollo chocolate piña arroz salchicha fresa tortilla sandia - ingrediente
        encimera fogon freidora horno tabla-corte fregadero pila salida armario - localizacion
        olla sarten - util
        zona-local zona-comun zona-inaccesible - zona

        localizacion cocinero util - ocupable
        util plato ingrediente cocinero - movible
        util plato - lavable
        lechuga tomate pepino pescado gamba patata masa champinion - cortable
    )

    (:predicates
        (en ?movible - movible ?localizacion - localizacion)
        (emplatado ?ingrediente - ingrediente ?plato - plato)
        (echado ?ingrediente - ingrediente ?util - util)
        (libre ?ocupable - ocupable)
        (cortado ?cortable - cortable)
        (cocinado ?ingrediente - ingrediente)
        (cocinado-sarten ?ingrediente - ingrediente)
        (limpio ?lavable - lavable)
        (lleva ?cocinero - cocinero ?movible - movible)
    )

    (:action emplatar
        :parameters (?plato - plato ?encimera - encimera ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (limpio ?plato)
            (en ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (emplatado ?ingrediente ?plato)
        )
    )

    (:action emplatar-util
        :parameters (?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (limpio ?plato)
            (en ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?util)
            (echado ?ingrediente ?util)
        )
        :effect (and
            (emplatado ?ingrediente ?plato)
            (not (echado ?ingrediente ?util))
            (libre ?util)
            (not (limpio ?util))
        )
    )

    (:action echar
        :parameters (?ingrediente - ingrediente ?util - util ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (limpio ?util)
            (en ?util ?localizacion)
            (libre ?util)
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?util))
            (not (libre ?util))
            (echado ?ingrediente ?util)
        )
    )

    (:action cocinar
        :parameters (?ingrediente - ingrediente ?olla - olla ?fogon - fogon ?cocinero - cocinero)
        :precondition (and
            (echado ?ingrediente ?olla)
            (en ?olla ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado ?ingrediente)
    )

    (:action cocinar-sarten
        :parameters (?ingrediente - ingrediente ?sarten - sarten ?fogon - fogon ?cocinero - cocinero)
        :precondition (and
            (echado ?ingrediente ?sarten)
            (en ?sarten ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado-sarten ?ingrediente)
    )

    (:action cortar
        :parameters (?ingrediente - cortable ?tabla-corte - tabla-corte ?cocinero - cocinero)
        :precondition (and
            (not (cortado ?ingrediente))
            (en ?ingrediente ?tabla-corte)
            (en ?cocinero ?tabla-corte)
            (libre ?cocinero)
        )
        :effect (cortado ?ingrediente)
    )

    (:action lavar
        :parameters (?lavable - lavable ?fregadero - fregadero ?cocinero - cocinero)
        :precondition (and
            (en ?lavable ?fregadero)
            (en ?cocinero ?fregadero)
            (libre ?cocinero)
        )
        :effect (limpio ?lavable)
    )

    (:action mover
        :parameters (?cocinero - cocinero ?l1 ?l2 - localizacion)
        :precondition (and
            (en ?cocinero ?l1)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (en ?cocinero ?l1))
            (en ?cocinero ?l2)
        )
    )

    (:action coger
        :parameters (?movible - movible ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (en ?cocinero ?localizacion)
            (libre ?cocinero)
            (en ?movible ?localizacion)
        )
        :effect (and
            (libre ?localizacion)
            (not (en ?movible ?localizacion))
            (lleva ?cocinero ?movible)
            (not (libre ?cocinero))
        )
    )

    (:action dejar
        :parameters (?movible - movible ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (libre ?localizacion)
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?movible)
        )
        :effect (and
            (not (libre ?localizacion))
            (en ?movible ?localizacion)
            (not (lleva ?cocinero ?movible))
            (libre ?cocinero)
        )
    )
)
