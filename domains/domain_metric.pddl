; This domain tests minimizing the metric
(define (domain overcooked)
    (:requirements :typing :negative-preconditions :equality :fluents)
    (:types
        util multiutil ingrediente cocinero zona localizacion movible lavable cortable - object
        cebolla lechuga tomate pepino champinion carne pollo pan tortita arroz pescado patata - ingrediente
        cambiador limbo encimera cinta tabla-corte tostadora fogon freidora fregadero pila entregador armario - localizacion
        olla sarten cesta - util
        multiolla - multiutil
        util multiutil plato ingrediente - movible
        util multiutil plato - lavable
        ; capacidad-numero - object
    )

    (:predicates
        (en ?cocinero - cocinero ?localizacion - localizacion)
        (pertenece ?localizacion - localizacion ?zona - zona)
        (puede-acceder ?cocinero - cocinero ?zona - zona)
        ; (conectadas ?zona1 ?zona2 - zona)
        (libre ?cocinero - cocinero)
        (lleva ?cocinero - cocinero ?movible - movible)

        (ocupada ?localizacion - localizacion)

        (sobre ?movible - movible ?localizacion - localizacion)
        (prohibido-dejar ?localizacion - localizacion)

        (entregado ?plato - plato)
        (sucio ?lavable - lavable)
        (lleno ?lavable - lavable)

        (emplatado ?ingrediente - ingrediente ?plato - plato)
        ; (emplatado-con-util ?ingrediente - ingrediente ?plato - plato) ; Es mas eficiente con esto pero es darle ventaja
        ; (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?plato - plato)
        ; (echado ?ingrediente - ingrediente ?util - util)
        ; (echado-multiple ?ingrediente - ingrediente ?multiutil - multiutil)
        (cortado ?ingrediente - ingrediente)
        ; (tostado ?ingrediente - ingrediente) ; Para un futuro tostar el pan de la hamburguesa
        (cocido ?ingrediente - ingrediente)
        ; (cocido3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente)
        (cocinado ?ingrediente - ingrediente)
        ; (frito ?ingrediente - ingrediente)

        (ensalada-lechuga ?plato - plato)
        (ensalada-lechuga-tomate ?plato - plato)
        (ensalada ?plato - plato)
    )

    (:functions
        (total-cost) - number
    )

    (:action emplatar
        :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?ingrediente - ingrediente)
        :precondition (and
            (sobre ?plato ?encimera)
            (not (sucio ?plato))
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (lleno ?plato)
            (emplatado ?ingrediente ?plato)
            (increase (total-cost) 1)
        )
    )

    ; (:action emplatar-util
    ;     :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente)
    ;     :precondition (and
    ;         (sobre ?plato ?encimera)
    ;         (not (sucio ?plato))
    ;         (en ?cocinero ?encimera)
    ;         (lleva ?cocinero ?util)
    ;         (echado ?ingrediente ?util)
    ;     )
    ;     :effect (and
    ;         (not (echado ?ingrediente ?util))
    ;         (not (lleno ?util))
    ;         (sucio ?util)
    ;         (lleno ?plato)
    ;         (emplatado ?ingrediente ?plato)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    ; (:action emplatar-util3
    ;     :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?multiutil - multiutil ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente)
    ;     :precondition (and
    ;         (sobre ?plato ?encimera)
    ;         (not (sucio ?plato))
    ;         (en ?cocinero ?encimera)
    ;         (lleva ?cocinero ?multiutil)
    ;         (echado-multiple ?ingrediente1 ?multiutil)
    ;         (echado-multiple ?ingrediente2 ?multiutil)
    ;         (echado-multiple ?ingrediente3 ?multiutil)
    ;     )
    ;     :effect (and
    ;         (not (echado-multiple ?ingrediente1 ?multiutil))
    ;         (not (echado-multiple ?ingrediente2 ?multiutil))
    ;         (not (echado-multiple ?ingrediente3 ?multiutil))
    ;         (sucio ?multiutil)
    ;         (lleno ?plato)
    ;         (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 ?plato)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    ; (:action echar
    ;     :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?util - util ?localizacion - localizacion)
    ;     :precondition (and
    ;         (sobre ?util ?localizacion)
    ;         (not (lleno ?util))
    ;         (not (sucio ?util))
    ;         (en ?cocinero ?localizacion)
    ;         (lleva ?cocinero ?ingrediente)
    ;     )
    ;     :effect (and
    ;         (libre ?cocinero)
    ;         (not (lleva ?cocinero ?ingrediente))
    ;         (lleno ?util)
    ;         (echado ?ingrediente ?util)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    ; (:action echar-multiple
    ;     :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?multiutil - multiutil ?localizacion - localizacion)
    ;     :precondition (and
    ;         (sobre ?multiutil ?localizacion)
    ;         (not (sucio ?multiutil))
    ;         (en ?cocinero ?localizacion)
    ;         (lleva ?cocinero ?ingrediente)
    ;     )
    ;     :effect (and
    ;         (libre ?cocinero)
    ;         (not (lleva ?cocinero ?ingrediente))
    ;         (echado-multiple ?ingrediente ?multiutil)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    (:action cortar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?tabla-corte - tabla-corte)
        :precondition (and
            (not (cocido ?ingrediente))
            (not (cocinado ?ingrediente))
            (sobre ?ingrediente ?tabla-corte)
            (en ?cocinero ?tabla-corte)
            (libre ?cocinero)
        )
        :effect (and
           (cortado ?ingrediente)
           (increase (total-cost) 5)
        )
    )

    ; (:action tostar
    ;     :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?tostadora - tostadora)
    ;     :precondition (and
    ;         (sobre ?ingrediente ?tostadora)
    ;         (en ?cocinero ?tostadora)
    ;         (libre ?cocinero)
    ;     )
    ;     :effect (and
    ;         (tostado ?ingrediente)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    ; (:action cocer
    ;     :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?olla - olla ?fogon - fogon)
    ;     :precondition (and
    ;         (echado ?ingrediente ?olla)
    ;         (sobre ?olla ?fogon)
    ;         (en ?cocinero ?fogon)
    ;         (libre ?cocinero)
    ;     )
    ;     :effect (and
    ;         (cocido ?ingrediente)
    ;         (increase (total-cost) 1)
    ;     )

    ; )

    ; (:action cocer3
    ;     :parameters (?cocinero - cocinero ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?multiolla - multiolla ?fogon - fogon)
    ;     :precondition (and
    ;         (echado-multiple ?ingrediente1 ?multiolla)
    ;         (echado-multiple ?ingrediente2 ?multiolla)
    ;         (echado-multiple ?ingrediente3 ?multiolla)
    ;         (sobre ?multiolla ?fogon)
    ;         (en ?cocinero ?fogon)
    ;         (libre ?cocinero)
    ;     )
    ;     :effect (and
    ;         (cocido3 ?ingrediente1 ?ingrediente2 ?ingrediente3)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    ; (:action cocinar
    ;     :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?sarten - sarten ?fogon - fogon)
    ;     :precondition (and
    ;         (echado ?ingrediente ?sarten)
    ;         (sobre ?sarten ?fogon)
    ;         (en ?cocinero ?fogon)
    ;         (libre ?cocinero)
    ;     )
    ;     :effect (and
    ;         (cocinado ?ingrediente)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    ; (:action freir
    ;     :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?cesta - cesta ?freidora - freidora)
    ;     :precondition (and
    ;         (echado ?ingrediente ?cesta)
    ;         (sobre ?cesta ?freidora)
    ;         (en ?cocinero ?freidora)
    ;         (libre ?cocinero)
    ;     )
    ;     :effect (and
    ;         (frito ?ingrediente)
    ;         (increase (total-cost) 1)
    ;     )
    ; )

    (:action lavar
        :parameters (?cocinero - cocinero ?lavable - lavable ?fregadero - fregadero)
        :precondition (and
            (not (lleno ?lavable))
            (sobre ?lavable ?fregadero)
            (en ?cocinero ?fregadero)
            (libre ?cocinero)
        )
        :effect (and
            (not (sucio ?lavable))
            (increase (total-cost) 1)
        )
    )

    (:action mover
        :parameters (?cocinero - cocinero ?l1 ?l2 - localizacion ?zona - zona)
        :precondition (and
            (en ?cocinero ?l1)
            (pertenece ?l2 ?zona)
            (puede-acceder ?cocinero ?zona)
        )
        :effect (and
            (not (en ?cocinero ?l1))
            (en ?cocinero ?l2)
            (increase (total-cost) 1)
        )
    )

    (:action coger
        :parameters (?cocinero - cocinero ?movible - movible ?localizacion - localizacion)
        :precondition (and
            (en ?cocinero ?localizacion)
            (libre ?cocinero)
            (sobre ?movible ?localizacion)
        )
        :effect (and
            (not (ocupada ?localizacion))
            (not (sobre ?movible ?localizacion))
            (lleva ?cocinero ?movible)
            (not (libre ?cocinero))
            (increase (total-cost) 1)
        )
    )

    (:action dejar
        :parameters (?cocinero - cocinero ?movible - movible ?localizacion - localizacion)
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
            (increase (total-cost) 1)
        )
    )

    (:action entregar
        :parameters (?cocinero - cocinero ?plato - plato ?entregador - entregador)
        :precondition (and
            (en ?cocinero ?entregador)
            (lleno ?plato)
            (lleva ?cocinero ?plato)
        )
        :effect (and
            (entregado ?plato)
            (not (lleva ?cocinero ?plato))
            (libre ?cocinero)
            (increase (total-cost) 1)
        )
    )

    (:action hacer-ensalada-lechuga
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga)
        :precondition (and
            (cortado ?lechuga)
            (emplatado ?lechuga ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (emplatado ?lechuga ?plato))
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (ensalada-lechuga ?plato)
            (increase (total-cost) 1)
        )
    )

    (:action hacer-ensalada-lechuga-tomate
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate)
        :precondition (and
            (cortado ?lechuga)
            (emplatado ?lechuga ?plato)
            (cortado ?tomate)
            (emplatado ?tomate ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (emplatado ?lechuga ?plato))
            (not (emplatado ?tomate ?plato))
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (ensalada-lechuga-tomate ?plato)
            (increase (total-cost) 1)
        )
    )

    (:action hacer-ensalada
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate ?pepino - pepino)
        :precondition (and
            (cortado ?lechuga)
            (emplatado ?lechuga ?plato)
            (cortado ?tomate)
            (emplatado ?tomate ?plato)
            (cortado ?pepino)
            (emplatado ?pepino ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (emplatado ?lechuga ?plato))
            (not (emplatado ?tomate ?plato))
            (not (emplatado ?pepino ?plato))
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (ensalada ?plato)
            (increase (total-cost) 1)
        )
    )
)