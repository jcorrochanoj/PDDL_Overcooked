(define (domain overcooked)
    (:requirements :typing :negative-preconditions :equality)
    (:types
        util ingrediente personal zona localizacion movible lavable cortable - object
        cebolla lechuga tomate pepino champinion carne pan - ingrediente
        encimera fogon freidora horno tabla-corte fregadero pila entregador armario - localizacion
        olla sarten - util
        cocinero - personal
        zona-local zona-comun zona-inaccesible - zona
        util plato ingrediente - movible
        util plato - lavable
        ; capacidad-numero - object
    )

    (:predicates
        (en ?personal - personal ?localizacion - localizacion)
        (sobre ?movible - movible ?localizacion - localizacion)
        (emplatado ?ingrediente - ingrediente ?plato - plato)
        (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?plato - plato)
        (entregado ?plato - plato)
        (lleno ?lavable - lavable)
        (echado ?ingrediente - ingrediente ?util - util)
        (libre ?personal - personal)
        (ocupada ?localizacion - localizacion)
        (cortado ?ingrediente - ingrediente)
        (cocinado ?ingrediente - ingrediente)
        (cocinado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente)
        (cocinado-sarten ?ingrediente - ingrediente)
        (sucio ?lavable - lavable)
        (lleva ?cocinero - cocinero ?movible - movible)

        ; (capacidad ?lavable - lavable ?s1 - capacidad-numero)
        ; (siguiente ?s1 ?s2 - capacidad-numero)
        ; (inicial ?s1 - capacidad-numero)

        (prohibido-usar ?localizacion - localizacion)
        (prohibido-dejar ?localizacion - localizacion)
        (prohibido-coger ?localizacion - localizacion)

        ; (ensalada-completa ?plato - plato)
        ; (ensalada-lechuga-tomate ?plato - plato)
        ; (ensalada-lechuga ?plato - plato)

        ; (hamburguesa-simple ?plato - plato)
        ; (hamburguesa-lechuga ?plato - plato)
        ; (hamburguesa-completa ?plato - plato)

        (sopa-tomate ?plato - plato)
        (sopa-cebolla ?plato - plato)
        (sopa-champinion ?plato - plato)
    )

    (:action emplatar
        :parameters (?plato - plato ?encimera - encimera ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?ingrediente)
            ; (siguiente ?s1 ?s2)
            ; (capacidad ?plato ?s1)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (not (lleno ?plato))
            (emplatado ?ingrediente ?plato)
            ; (capacidad ?plato ?s2)
            ; (not (capacidad ?plato ?s1))
        )
    )

    (:action emplatar-util
        :parameters (?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?util)
            (echado ?ingrediente ?util)
            ; (siguiente ?s1 ?s2)
            ; (capacidad ?plato ?s2)
        )
        :effect (and
            (not (echado ?ingrediente ?util))
            (not (lleno ?util))
            (sucio ?util)
            (lleno ?plato)
            (emplatado ?ingrediente ?plato)
            ; (capacidad ?plato ?s2)
            ; (not (capacidad ?plato ?s1))
        )
    )

    (:action emplatar-util3
        :parameters (?plato - plato ?encimera - encimera ?util - util ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?cocinero - cocinero)
        :precondition (and
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?util)
            (echado ?ingrediente1 ?util)
            (echado ?ingrediente2 ?util)
            (echado ?ingrediente3 ?util)
            ; (siguiente ?s1 ?s2)
            ; (siguiente ?s2 ?s3)
            ; (siguiente ?s3 ?s4)
            ; (capacidad ?plato ?s1)
        )
        :effect (and
            (not (echado ?ingrediente1 ?util))
            (not (echado ?ingrediente2 ?util))
            (not (echado ?ingrediente3 ?util))
            (not (lleno ?util))
            (sucio ?util)
            (lleno ?plato)
            (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 ?plato)
            ; (capacidad ?plato ?s4)
            ; (not (capacidad ?plato ?s1))
        )
    )

    (:action echar
        :parameters (?ingrediente - ingrediente ?util - util ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (not (prohibido-usar ?localizacion))
            (not (sucio ?util))
            (sobre ?util ?localizacion)
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

    (:action cocinar3
        :parameters (?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?olla - olla ?fogon - fogon ?cocinero - cocinero)
        :precondition (and
            (echado ?ingrediente1 ?olla)
            (echado ?ingrediente2 ?olla)
            (echado ?ingrediente3 ?olla)
            (sobre ?olla ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado3 ?ingrediente1 ?ingrediente2 ?ingrediente3)
    )

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

    ; (:action hacer-ensalada-lechuga
    ;     :parameters (?plato - plato ?pila - pila ?lechuga - lechuga)
    ;     :precondition (and
    ;         (cortado ?lechuga)
    ;         (emplatado ?lechuga ?plato)
    ;         ; (inicial ?s0)
    ;         ; (siguiente ?s0 ?s1)
    ;         ; (capacidad ?plato ?s1)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?lechuga ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         ; (capacidad ?plato ?s0)
    ;         ; (not (capacidad ?plato ?s1))
    ;         (ensalada-lechuga ?plato)
    ;     )
    ; )

    ; (:action hacer-ensalada-lechuga-tomate
    ;     :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate)
    ;     :precondition (and
    ;         (cortado ?lechuga)
    ;         (cortado ?tomate)
    ;         (emplatado ?lechuga ?plato)
    ;         (emplatado ?tomate ?plato)
    ;         ; (inicial ?s0)
    ;         ; (siguiente ?s0 ?s1)
    ;         ; (siguiente ?s1 ?s2)
    ;         ; (capacidad ?plato ?s2)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?lechuga ?plato))
    ;         (not (emplatado ?tomate ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         ; (capacidad ?plato ?s0)
    ;         ; (not (capacidad ?plato ?s2))
    ;         (ensalada-lechuga-tomate ?plato)
    ;     )
    ; )

    ; (:action hacer-ensalada-completa
    ;     :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate ?pepino - pepino)
    ;     :precondition (and
    ;         (cortado ?lechuga)
    ;         (cortado ?tomate)
    ;         (cortado ?pepino)
    ;         (emplatado ?lechuga ?plato)
    ;         (emplatado ?tomate ?plato)
    ;         (emplatado ?pepino ?plato)
    ;         ; (inicial ?s0)
    ;         ; (siguiente ?s0 ?s1)
    ;         ; (siguiente ?s1 ?s2)
    ;         ; (siguiente ?s1 ?s3)
    ;         ; (capacidad ?plato ?s3)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?lechuga ?plato))
    ;         (not (emplatado ?tomate ?plato))
    ;         (not (emplatado ?pepino ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         ; (capacidad ?plato ?s0)
    ;         ; (not (capacidad ?plato ?s3))
    ;         (ensalada-completa ?plato)
    ;     )
    ; )

    ; (:action hacer-hamburguesa-simple
    ;     :parameters (?plato - plato ?pila - pila ?pan - pan ?carne - carne)
    ;     :precondition (and
    ;         (cortado ?carne)
    ;         (cocinado-sarten ?carne)
    ;         (emplatado ?pan ?plato)
    ;         (emplatado ?carne ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?pan ?plato))
    ;         (not (emplatado ?carne ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (hamburguesa-simple ?plato)
    ;     )
    ; )

    ; (:action hacer-hamburguesa-lechuga
    ;     :parameters (?plato - plato ?pila - pila ?pan - pan ?lechuga - lechuga ?carne - carne)
    ;     :precondition (and
    ;         (cortado ?lechuga)
    ;         (cortado ?carne)
    ;         (cocinado-sarten ?carne)
    ;         (emplatado ?pan ?plato)
    ;         (emplatado ?lechuga ?plato)
    ;         (emplatado ?carne ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?pan ?plato))
    ;         (not (emplatado ?lechuga ?plato))
    ;         (not (emplatado ?carne ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (hamburguesa-lechuga ?plato)
    ;     )
    ; )

    ; (:action hacer-hamburguesa-completa-simple
    ;     :parameters (?plato - plato ?pila - pila ?pan - pan ?lechuga - lechuga ?tomate - tomate ?carne - carne)
    ;     :precondition (and
    ;         (cortado ?lechuga)
    ;         (cortado ?tomate)
    ;         (cortado ?carne)
    ;         (cocinado-sarten ?carne)
    ;         (emplatado ?pan ?plato)
    ;         (emplatado ?lechuga ?plato)
    ;         (emplatado ?tomate ?plato)
    ;         (emplatado ?carne ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?pan ?plato))
    ;         (not (emplatado ?lechuga ?plato))
    ;         (not (emplatado ?tomate ?plato))
    ;         (not (emplatado ?carne ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (hamburguesa-completa ?plato)
    ;     )
    ; )

    (:action hacer-sopa-tomate
        :parameters (?plato - plato ?pila - pila ?tomate1 ?tomate2 ?tomate3 - tomate)
        :precondition (and
            (not (= ?tomate1 ?tomate2))
            (not (= ?tomate2 ?tomate3))
            (not (= ?tomate1 ?tomate3))
            (cortado ?tomate1)
            (cortado ?tomate2)
            (cortado ?tomate3)
            (cocinado3 ?tomate1 ?tomate2 ?tomate3)
            (emplatado3 ?tomate1 ?tomate2 ?tomate3 ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (sopa-tomate ?plato)
        )
    )

    (:action hacer-sopa-cebolla
        :parameters (?plato - plato ?pila - pila ?cebolla1 ?cebolla2 ?cebolla3 - cebolla)
        :precondition (and
            (not (= ?cebolla1 ?cebolla2))
            (not (= ?cebolla2 ?cebolla3))
            (not (= ?cebolla1 ?cebolla3))
            (cortado ?cebolla1)
            (cortado ?cebolla2)
            (cortado ?cebolla3)
            (cocinado3 ?cebolla1 ?cebolla2 ?cebolla3)
            (emplatado3 ?cebolla1 ?cebolla2 ?cebolla3 ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (sopa-cebolla ?plato)
        )
    )

    (:action hacer-sopa-champinion
        :parameters (?plato - plato ?pila - pila ?champinion1 ?champinion2 ?champinion3 - champinion)
        :precondition (and
            (not (= ?champinion1 ?champinion2))
            (not (= ?champinion2 ?champinion3))
            (not (= ?champinion1 ?champinion3))
            (cortado ?champinion1)
            (cortado ?champinion2)
            (cortado ?champinion3)
            (cocinado3 ?champinion1 ?champinion2 ?champinion3)
            (emplatado3 ?champinion1 ?champinion2 ?champinion3 ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (sucio ?plato)
            (sobre ?plato ?pila)
            (sopa-champinion ?plato)
        )
    )
)
