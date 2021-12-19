;; Overcooked V1 sequential
;;

(define (domain overcooked_v1)
    (:requirements :typing :action-costs :negative-preconditions)
    (:types
        movible usable - object
        localizacion cocinero - usable
        encimera fogon freidora horno tabla-corte fregadero pila armario - localizacion
        zona-local zona-comun - zona
        util lavable ingrediente - movible
        plato - lavable
        olla sarten - util
        sacable alga - ingrediente
        cocinable cortable - sacable
        lechuga tomate pepino pescado gamba  - cortable
        bacon banana carne frambuesa pan zanahoria queso pollo chocolate masa harina champinion piña patata arroz salchicha fresa tortilla sandia - cocinable
    )

    (:predicates
        (en ?movible - movible ?localizacion - localizacion)
        (emplatado ?i - ingrediente ?plato - plato)
        (echado ?ingrediente - ingrediente ?olla - olla)
        (libre ?usable - usable)
        (libre-util ?util - util)
        (cortado ?cortable - cortable)
        (cocinado ?cocinable - cocinable)
        (cocinado-sarten ?cocinable-sarten - cocinable-sarten)
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
            (libre-util ?util)
            (not (limpio ?util))
        )
    )

    (:action echar
        :parameters (?ingrediente - ingrediente ?util - util ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (limpio ?util)
            (en ?util ?localizacion)
            (libre-util ?util)
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?util))
            (not (libre-util ?util))
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

    (:action sacar
        :parameters (?ingrediente - ingrediente ?armario - armario ?cocinero - cocinero)
        :precondition (and
            (en ?cocinero ?armario)
            (libre ?cocinero)
            (en ?ingrediente ?armario)
        )
        :effect (and
            (not (en ?ingrediente ?armario))
            (lleva ?cocinero ?ingrediente)
            (not (libre ?cocinero))
        )
    )

    (:action mover
        :parameters (?l1 ?l2 - localizacion ?cocinero - cocinero)
        :precondition (and
            (en ?cocinero ?l1)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (cocinero-en ?cocinero ?l1))
            (cocinero-en ?cocinero ?l2)
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
            (not (en ?movible ?localizacon))
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
            (not (lleva ?cocinero ?movibñe))
            (libre ?cocinero)
        )
    )
)