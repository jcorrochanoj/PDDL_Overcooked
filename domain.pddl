(define (domain overcooked)
    (:requirements :typing :negative-preconditions :equality :fluents)
    (:types
        util ingrediente personal zona localizacion movible lavable cortable - object
        lechuga tomate pepino pescado gamba patata masa champinion alga bacon banana carne frambuesa pan zanahoria queso pollo chocolate piña arroz salchicha fresa tortilla sandia - ingrediente
        encimera fogon freidora horno tabla-corte fregadero pila entregador armario - localizacion
        olla sarten - util
        cocinero - personal
        zona-local zona-comun zona-inaccesible - zona
        util plato ingrediente - movible
        util plato - lavable
    )

    (:predicates
        (en ?personal - personal ?localizacion - localizacion)
        (sobre ?movible - movible ?localizacion - localizacion)
        (emplatado ?ingrediente - ingrediente ?plato - plato)
        ; (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?plato - plato)
        (usado ?ingrediente - ingrediente)
        (entregado ?plato - plato)
        (lleno ?lavable - lavable)
        (echado ?ingrediente - ingrediente ?util - util)
        (libre ?personal - personal)
        (ocupada ?localizacion - localizacion)
        (cortado ?ingrediente - ingrediente)
        (cocinado ?ingrediente - ingrediente)
        ; (cocinado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente)
        (cocinado-sarten ?ingrediente - ingrediente)
        (sucio ?lavable - lavable)
        (lleva ?cocinero - cocinero ?movible - movible)
        (prohibido-usar ?localizacion - localizacion)
        (prohibido-dejar ?localizacion - localizacion)
        (prohibido-coger ?localizacion - localizacion)

        (ensalada-completa-hecha ?plato - plato)
        (ensalada-lechuga-tomate-hecha ?plato - plato)
        (ensalada-lechuga-hecha ?plato - plato)

        (hamburguesa-simple-hecha ?plato - plato)
        (hamburguesa-lechuga-hecha ?plato - plato)
        (hamburguesa-completa-hecha ?plato - plato)

        ; (sopa-tomate-hecha ?plato - plato)
        ; (sopa-cebolla-hecha ?plato - plato)
        ; (sopa-champinion-hecha ?plato - plato)
    )

    (:functions
        (eleboraciones ?plato - plato)
    )

    (:action emplatar
        :parameters (?plato - plato ?encimera - encimera ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (not (usado ?ingrediente))
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (not (lleno ?plato))
            (usado ?ingrediente)
            (emplatado ?ingrediente ?plato)
            (increase (eleboraciones ?plato) 1)
        )
    )

    (:action emplatar-util
        :parameters (?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (not (usado ?ingrediente))
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?util)
            (echado ?ingrediente ?util)
        )
        :effect (and
            (not (echado ?ingrediente ?util))
            (not (lleno ?util))
            (sucio ?util)
            (lleno ?plato)
            (usado ?ingrediente)
            (emplatado ?ingrediente ?plato)
            (increase (eleboraciones ?plato) 1)
        )
    )

    ; (:action emplatar-util3
    ;     :parameters (?plato - plato ?encimera - encimera ?util - util ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?cocinero - cocinero)
    ;     :precondition (and
    ;         (not (usado ?ingrediente1))
    ;         (not (usado ?ingrediente2))
    ;         (not (usado ?ingrediente3))
    ;         (not (prohibido-usar ?encimera))
    ;         (sobre ?plato ?encimera)
    ;         (en ?cocinero ?encimera)
    ;         (lleva ?cocinero ?util)
    ;         (echado ?ingrediente1 ?util)
    ;         (echado ?ingrediente2 ?util)
    ;         (echado ?ingrediente3 ?util)
    ;     )
    ;     :effect (and
    ;         (not (echado ?ingrediente1 ?util))
    ;         (not (echado ?ingrediente2 ?util))
    ;         (not (echado ?ingrediente3 ?util))
    ;         (not (lleno ?util))
    ;         (sucio ?util)
    ;         (lleno ?plato)
    ;         (usado ?ingrediente1)
    ;         (usado ?ingrediente2)
    ;         (usado ?ingrediente3)
    ;         (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 ?plato)
    ;         (increase (eleboraciones ?plato) 3)
    ;     )
    ; )

    (:action echar
        :parameters (?ingrediente - ingrediente ?util - util ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (not (usado ?ingrediente))
            (not (prohibido-usar ?localizacion))
            (not (sucio ?util))
            (sobre ?util ?localizacion)
            (not (lleno ?util))
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (lleno ?util)
            (echado ?ingrediente ?util)
        )
    )

    (:action cocinar
        :parameters (?ingrediente - ingrediente ?olla - olla ?fogon - fogon ?cocinero - cocinero)
        :precondition (and
            (echado ?ingrediente ?olla)
            (sobre ?olla ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado ?ingrediente)
    )

    ; (:action cocinar3
    ;     :parameters (?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?olla - olla ?fogon - fogon ?cocinero - cocinero)
    ;     :precondition (and
    ;         (not (= ?ingrediente1 ?ingrediente2))
    ;         (not (= ?ingrediente2 ?ingrediente3))
    ;         (not (= ?ingrediente1 ?ingrediente3))
    ;         (echado ?ingrediente1 ?olla)
    ;         (echado ?ingrediente2 ?olla)
    ;         (echado ?ingrediente3 ?olla)
    ;         (sobre ?olla ?fogon)
    ;         (en ?cocinero ?fogon)
    ;         (libre ?cocinero)
    ;     )
    ;     :effect (cocinado3 ?ingrediente1 ?ingrediente2 ?ingrediente3)
    ; )

    (:action cocinar-sarten
        :parameters (?ingrediente - ingrediente ?sarten - sarten ?fogon - fogon ?cocinero - cocinero)
        :precondition (and
            (echado ?ingrediente ?sarten)
            (sobre ?sarten ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado-sarten ?ingrediente)
    )

    (:action cortar
        :parameters (?ingrediente - ingrediente ?tabla-corte - tabla-corte ?cocinero - cocinero)
        :precondition (and
            (not (usado ?ingrediente))
            (not (cocinado ?ingrediente))
            (sobre ?ingrediente ?tabla-corte)
            (en ?cocinero ?tabla-corte)
            (libre ?cocinero)
        )
        :effect (cortado ?ingrediente)
    )

    (:action lavar
        :parameters (?lavable - lavable ?fregadero - fregadero ?cocinero - cocinero)
        :precondition (and
            (not (lleno ?lavable))
            (sobre ?lavable ?fregadero)
            (en ?cocinero ?fregadero)
            (libre ?cocinero)
        )
        :effect (not (sucio ?lavable))
    )

    (:action mover
        :parameters (?personal - personal ?l1 ?l2 - localizacion)
        :precondition (and
            (en ?personal ?l1)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (not (en ?personal ?l1))
            (en ?personal ?l2)
        )
    )

    (:action coger
        :parameters (?movible - movible ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (not (prohibido-coger ?localizacion))
            (en ?cocinero ?localizacion)
            (libre ?cocinero)
            (sobre ?movible ?localizacion)
        )
        :effect (and
            (not (ocupada ?localizacion))
            (not (sobre ?movible ?localizacion))
            (lleva ?cocinero ?movible)
            (not (libre ?cocinero))
        )
    )

    (:action dejar
        :parameters (?movible - movible ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (not (prohibido-dejar ?localizacion))
            (not (ocupada ?localizacion))
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?movible)
        )
        :effect (and
            (ocupada ?localizacion)
            (sobre ?movible ?localizacion)
            (not (lleva ?cocinero ?movible))
            (libre ?cocinero)
        )
    )

    (:action entregar
        :parameters (?plato - plato ?entregador - entregador ?cocinero - cocinero)
        :precondition (and
            (not (sucio ?plato))
            (en ?cocinero ?entregador)
            (lleva ?cocinero ?plato)
        )
        :effect (and
            (entregado ?plato)
            (not (lleva ?cocinero ?plato))
            (libre ?cocinero)
        )
    )

    (:action ensalada-lechuga-tomate
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate)
        :precondition (and
            (cortado ?lechuga)
            (cortado ?tomate)
            (emplatado ?lechuga ?plato)
            (emplatado ?tomate ?plato)
            (= (eleboraciones ?plato) 2)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (eleboraciones ?plato) 0)
            (ensalada-lechuga-tomate-hecha ?plato)
        )
    )

    (:action ensalada-lechuga
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga)
        :precondition (and
            (cortado ?lechuga)
            (emplatado ?lechuga ?plato)
            (= (eleboraciones ?plato) 2)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (eleboraciones ?plato) 0)
            (ensalada-lechuga-hecha ?plato)
        )
    )

    (:action ensalada-completa
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate ?pepino - pepino)
        :precondition (and
            (cortado ?lechuga)
            (cortado ?tomate)
            (cortado ?pepino)
            (emplatado ?lechuga ?plato)
            (emplatado ?tomate ?plato)
            (emplatado ?pepino ?plato)
            (= (eleboraciones ?plato) 3)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (eleboraciones ?plato) 0)
            (ensalada-completa-hecha ?plato)
        )
    )

    (:action hamburguesa-simple
        :parameters (?plato - plato ?pila - pila ?pan - pan ?carne - carne)
        :precondition (and
            (cortado ?carne)
            (cocinado-sarten ?carne)
            (emplatado ?pan ?plato)
            (emplatado ?carne ?plato)
            (= (eleboraciones ?plato) 2)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (eleboraciones ?plato) 0)
            (hamburguesa-simple-hecha ?plato)
        )
    )

    (:action hamburguesa-lechuga
        :parameters (?plato - plato ?pila - pila ?pan - pan ?lechuga - lechuga ?carne - carne)
        :precondition (and
            (cortado ?lechuga)
            (cortado ?carne)
            (cocinado-sarten ?carne)
            (emplatado ?pan ?plato)
            (emplatado ?lechuga ?plato)
            (emplatado ?carne ?plato)
            (= (eleboraciones ?plato) 2)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (eleboraciones ?plato) 0)
            (hamburguesa-lechuga-hecha ?plato)
        )
    )

    (:action hamburguesa-completa-simple
        :parameters (?plato - plato ?pila - pila ?pan - pan ?lechuga - lechuga ?tomate - tomate ?carne - carne)
        :precondition (and
            (cortado ?lechuga)
            (cortado ?tomate)
            (cortado ?carne)
            (cocinado-sarten ?carne)
            (emplatado ?pan ?plato)
            (emplatado ?lechuga ?plato)
            (emplatado ?tomate ?plato)
            (emplatado ?carne ?plato)
            (= (eleboraciones ?plato) 2)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (eleboraciones ?plato) 0)
            (hamburguesa-completa-hecha ?plato)
        )
    )

    ; (:action sopa-tomate
    ;     :parameters (?plato - plato ?pila - pila ?tomate1 ?tomate2 ?tomate3 - tomate)
    ;     :precondition (and
    ;         (not (= ?tomate1 ?tomate2))
    ;         (not (= ?tomate2 ?tomate3))
    ;         (not (= ?tomate1 ?tomate3))
    ;         (cortado ?tomate1)
    ;         (cortado ?tomate2)
    ;         (cortado ?tomate3)
    ;         (cocinado3 ?tomate1 ?tomate2 ?tomate3)
    ;         (emplatado3 ?tomate1 ?tomate2 ?tomate3 ?plato)
    ;         (= (eleboraciones ?plato) 3)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (assign (eleboraciones ?plato) 0)
    ;         (sopa-tomate-hecha ?plato)
    ;     )
    ; )

    ; (:action sopa-cebolla
    ;     :parameters (?plato - plato ?pila - pila ?cebolla1 ?cebolla2 ?cebolla3 - cebolla)
    ;     :precondition (and
    ;         (not (= ?cebolla1 ?cebolla2))
    ;         (not (= ?cebolla2 ?cebolla3))
    ;         (not (= ?cebolla1 ?cebolla3))
    ;         (cortado ?cebolla1)
    ;         (cortado ?cebolla2)
    ;         (cortado ?cebolla3)
    ;         (cocinado3 ?cebolla1 ?cebolla2 ?cebolla3)
    ;         (emplatado3 ?cebolla1 ?cebolla2 ?cebolla3 ?plato)
    ;         (= (eleboraciones ?plato) 3)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (assign (eleboraciones ?plato) 0)
    ;         (sopa-cebolla-hecha ?plato)
    ;     )
    ; )

    ; (:action sopa-champinion
    ;     :parameters (?plato - plato ?pila - pila ?champinion1 ?champinion2 ?champinion3 - champinion)
    ;     :precondition (and
    ;         (not (= ?champinion1 ?champinion2))
    ;         (not (= ?champinion2 ?champinion3))
    ;         (not (= ?champinion1 ?champinion3))
    ;         (cortado ?champinion1)
    ;         (cortado ?champinion2)
    ;         (cortado ?champinion3)
    ;         (cocinado3 ?champinion1 ?champinion2 ?champinion3)
    ;         (emplatado3 ?champinion1 ?champinion2 ?champinion3 ?plato)
    ;         (= (eleboraciones ?plato) 3)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (assign (eleboraciones ?plato) 0)
    ;         (sopa-champinion-hecha ?plato)
    ;     )
    ; )
)
