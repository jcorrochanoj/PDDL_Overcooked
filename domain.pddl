(define (domain overcooked)
    (:requirements :typing :negative-preconditions :equality)
    (:types
        util multiutil ingrediente personal zona localizacion movible lavable cortable - object
        ; zona-intercambio - zona
        cebolla lechuga tomate pepino champinion carne pollo pan tortita arroz pescado patata - ingrediente
        cambiador limbo encimera cinta tabla-corte tostadora fogon freidora fregadero pila entregador armario - localizacion
        olla sarten cesta - util
        multiolla - multiutil
        cocinero - personal
        util multiutil plato ingrediente - movible
        util multiutil plato - lavable
        ; capacidad-numero - object
    )

    (:predicates
        (en ?personal - personal ?localizacion - localizacion)
        (pertenece ?localizacion - localizacion ?zona - zona)
        (puede-acceder ?personal - personal ?zona - zona)
        ; (conectadas ?zona1 ?zona2 - zona)
        (libre ?personal - personal)
        (lleva ?cocinero - cocinero ?movible - movible)

        (ocupada ?localizacion - localizacion)

        (sobre ?movible - movible ?localizacion - localizacion)
        (prohibido-usar ?localizacion - localizacion)
        (prohibido-dejar ?localizacion - localizacion)

        (entregado ?plato - plato)
        (sucio ?lavable - lavable)
        (lleno ?lavable - lavable)

        (emplatado ?ingrediente - ingrediente ?plato - plato)
        ; (emplatado-con-util ?ingrediente - ingrediente ?plato - plato) ; Es mas eficiente con esto pero es darle ventaja
        (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?plato - plato)
        (echado ?ingrediente - ingrediente ?util - util)
        (echado-multiple ?ingrediente - ingrediente ?multiutil - multiutil)
        (cortado ?ingrediente - ingrediente)
        (tostado ?ingrediente - ingrediente) ; Para un futuro tostar el pan de la hamburguesa
        (cocido ?ingrediente - ingrediente)
        (cocido3 ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente)
        (cocinado ?ingrediente - ingrediente)
        (frito ?ingrediente - ingrediente)

        ; (capacidad ?lavable - lavable ?s1 - capacidad-numero)
        ; (siguiente ?s1 ?s2 - capacidad-numero)
        ; (inicial ?s1 - capacidad-numero)

        ; (ensalada-lechuga ?plato - plato)
        ; (ensalada-lechuga-tomate ?plato - plato)
        ; (ensalada ?plato - plato)

        ; (hamburguesa-simple ?plato - plato)
        ; (hamburguesa-lechuga ?plato - plato)
        ; (hamburguesa ?plato - plato)

        ; (sopa-tomate ?plato - plato)
        ; (sopa-cebolla ?plato - plato)
        ; (sopa-champinion ?plato - plato)

        ; (pescado-frito ?plato - plato)
        ; (patatas-fritas ?plato - plato)
        ; (fish-and-chips ?plato - plato)

        ; (burrito-pollo ?plato)
        ; (burrito-carne ?plato)
    )

    (:action emplatar
        :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?ingrediente - ingrediente)
        :precondition (and
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (not (sucio ?plato))
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
        :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente)
        :precondition (and
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (not (sucio ?plato))
            (en ?cocinero ?encimera)
            (lleno ?util)
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
        :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?multiutil - multiutil ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente)
        :precondition (and
            (not (prohibido-usar ?encimera))
            (sobre ?plato ?encimera)
            (not (sucio ?plato))
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?multiutil)
            (echado-multiple ?ingrediente1 ?multiutil)
            (echado-multiple ?ingrediente2 ?multiutil)
            (echado-multiple ?ingrediente3 ?multiutil)
            ; (siguiente ?s1 ?s2)
            ; (siguiente ?s2 ?s3)
            ; (siguiente ?s3 ?s4)
            ; (capacidad ?plato ?s1)
        )
        :effect (and
            (not (echado-multiple ?ingrediente1 ?multiutil))
            (not (echado-multiple ?ingrediente2 ?multiutil))
            (not (echado-multiple ?ingrediente3 ?multiutil))
            (sucio ?multiutil)
            (lleno ?plato)
            (emplatado3 ?ingrediente1 ?ingrediente2 ?ingrediente3 ?plato)
            ; (capacidad ?plato ?s4)
            ; (not (capacidad ?plato ?s1))
        )
    )

    (:action echar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?util - util ?localizacion - localizacion)
        :precondition (and
            (not (prohibido-usar ?localizacion))
            (sobre ?util ?localizacion)
            (not (lleno ?util))
            (not (sucio ?util))
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

    (:action echar-multiple
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?multiutil - multiutil ?localizacion - localizacion)
        :precondition (and
            (not (prohibido-usar ?localizacion))
            (sobre ?multiutil ?localizacion)
            (not (sucio ?multiutil))
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (lleno ?multiutil)
            (echado-multiple ?ingrediente ?multiutil)
        )
    )

    (:action cortar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?tabla-corte - tabla-corte)
        :precondition (and
            (not (cocido ?ingrediente))
            (not (cocinado ?ingrediente))
            (sobre ?ingrediente ?tabla-corte)
            (en ?cocinero ?tabla-corte)
            (libre ?cocinero)
        )
        :effect (cortado ?ingrediente)
    )

    (:action tostar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?tostadora - tostadora)
        :precondition (and
            (not (cocido ?ingrediente))
            (not (cocinado ?ingrediente))
            (sobre ?ingrediente ?tostadora)
            (en ?cocinero ?tostadora)
            (libre ?cocinero)
        )
        :effect (tostado ?ingrediente)
    )

    (:action cocinar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?olla - olla ?fogon - fogon)
        :precondition (and
            (echado ?ingrediente ?olla)
            (sobre ?olla ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocido ?ingrediente)
    )

    (:action cocinar3
        :parameters (?cocinero - cocinero ?ingrediente1 ?ingrediente2 ?ingrediente3 - ingrediente ?multiolla - multiolla ?fogon - fogon)
        :precondition (and
            (echado-multiple ?ingrediente1 ?multiolla)
            (echado-multiple ?ingrediente2 ?multiolla)
            (echado-multiple ?ingrediente3 ?multiolla)
            (sobre ?multiolla ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocido3 ?ingrediente1 ?ingrediente2 ?ingrediente3)
    )

    (:action cocinar-sarten
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?sarten - sarten ?fogon - fogon)
        :precondition (and
            (echado ?ingrediente ?sarten)
            (sobre ?sarten ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado ?ingrediente)
    )

    (:action freir
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?cesta - cesta ?freidora - freidora)
        :precondition (and
            (echado ?ingrediente ?cesta)
            (sobre ?cesta ?freidora)
            (en ?cocinero ?freidora)
            (libre ?cocinero)
        )
        :effect (frito ?ingrediente)
    )

    (:action lavar
        :parameters (?cocinero - cocinero ?lavable - lavable ?fregadero - fregadero)
        :precondition (and
            (not (lleno ?lavable))
            (sobre ?lavable ?fregadero)
            (en ?cocinero ?fregadero)
            (libre ?cocinero)
        )
        :effect (not (sucio ?lavable))
    )

    (:action mover
        :parameters (?personal - personal ?l1 ?l2 - localizacion ?zona - zona)
        :precondition (and
            (en ?personal ?l1)
            (pertenece ?l2 ?zona)
            (puede-acceder ?personal ?zona)
        )
        :effect (and
            (not (en ?personal ?l1))
            (en ?personal ?l2)
        )
    )

    ; (:action cambiar
    ;     :parameters (?personal - personal ?limbo1 ?limbo2 - limbo ?zona1 ?zona2 - zona)
    ;     :precondition (and
    ;         (en ?personal ?limbo1)
    ;         (pertenece ?limbo1 ?zona1)
    ;         (not (pertenece ?limbo1 ?zona2))
    ;         (pertenece ?limbo2 ?zona2)
    ;         (not (pertenece ?limbo2 ?zona1))
    ;         (puede-acceder ?personal ?zona1)
    ;         (conectadas ?zona1 ?zona2)
    ;     )
    ;     :effect (and
    ;         (not (en ?personal ?limbo1))
    ;         (not (puede-acceder ?personal ?zona1))
    ;         (en ?personal ?limbo2)
    ;         (puede-acceder ?personal ?zona2)
    ;     )
    ; )

    ; (:action cambiar-zona
    ;     :parameters (?personal1 ?personal2 - personal ?cambiador - cambiador ?zona1 ?zona2 - zona ?zona-intercambio - zona-intercambio)
    ;     :precondition (and
    ;         (en ?personal1 ?cambiador)
    ;         (pertenece ?cambiador ?zona1)
    ;         (not (pertenece ?cambiador ?zona2))
    ;         (not (pertenece ?cambiador ?zona-intercambio))

    ;         (puede-acceder ?personal1 ?zona1)
    ;         (puede-acceder ?personal1 ?zona-intercambio)
    ;         (not (puede-acceder ?personal1 ?zona2))

    ;         (not (puede-acceder ?personal2 ?zona1))
    ;         (not (puede-acceder ?personal2 ?zona-intercambio))
    ;         (puede-acceder ?personal2 ?zona2)
    ;     )
    ;     :effect (and
    ;         (not (puede-acceder ?personal1 ?zona-intercambio))
    ;         (puede-acceder ?personal2 ?zona-intercambio)
    ;     )
    ; )

    (:action coger
        :parameters (?personal - personal ?movible - movible ?localizacion - localizacion)
        :precondition (and
            (en ?personal ?localizacion)
            (libre ?personal)
            (sobre ?movible ?localizacion)
        )
        :effect (and
            (not (ocupada ?localizacion))
            (not (sobre ?movible ?localizacion))
            (lleva ?personal ?movible)
            (not (libre ?personal))
        )
    )

    (:action dejar
        :parameters (?personal - personal ?movible - movible ?localizacion - localizacion)
        :precondition (and
            (not (prohibido-dejar ?localizacion))
            (not (ocupada ?localizacion))
            (en ?personal ?localizacion)
            (lleva ?personal ?movible)
        )
        :effect (and
            (ocupada ?localizacion)
            (sobre ?movible ?localizacion)
            (not (lleva ?personal ?movible))
            (libre ?personal)
        )
    )

    (:action entregar
        :parameters (?cocinero - cocinero ?plato - plato ?entregador - entregador)
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
    ;         (emplatado ?lechuga ?plato)
    ;         (cortado ?tomate)
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

    ; (:action hacer-ensalada
    ;     :parameters (?plato - plato ?pila - pila ?lechuga - lechuga ?tomate - tomate ?pepino - pepino)
    ;     :precondition (and
    ;         (cortado ?lechuga)
    ;         (emplatado ?lechuga ?plato)
    ;         (cortado ?tomate)
    ;         (emplatado ?tomate ?plato)
    ;         (cortado ?pepino)
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
    ;         (ensalada ?plato)
    ;     )
    ; )

    ; (:action hacer-hamburguesa-simple
    ;     :parameters (?plato - plato ?pila - pila ?pan - pan ?carne - carne)
    ;     :precondition (and
    ;         (tostado ?pan)
    ;         (emplatado ?pan ?plato)
    ;         (cortado ?carne)
    ;         (cocinado ?carne)
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
    ;         (tostado ?pan)
    ;         (emplatado ?pan ?plato)
    ;         (cortado ?lechuga)
    ;         (emplatado ?lechuga ?plato)
    ;         (cortado ?carne)
    ;         (cocinado ?carne)
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

    ; (:action hacer-hamburguesa
    ;     :parameters (?plato - plato ?pila - pila ?pan - pan ?lechuga - lechuga ?tomate - tomate ?carne - carne)
    ;     :precondition (and
    ;         (tostado ?pan)
    ;         (emplatado ?pan ?plato)
    ;         (cortado ?lechuga)
    ;         (emplatado ?lechuga ?plato)
    ;         (cortado ?tomate)
    ;         (emplatado ?tomate ?plato)
    ;         (cortado ?carne)
    ;         (cocinado ?carne)
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
    ;         (hamburguesa ?plato)
    ;     )
    ; )

    ; (:action hacer-sopa-tomate
    ;     :parameters (?plato - plato ?pila - pila ?tomate1 ?tomate2 ?tomate3 - tomate)
    ;     :precondition (and
    ;         (not (= ?tomate1 ?tomate2))
    ;         (not (= ?tomate2 ?tomate3))
    ;         (not (= ?tomate1 ?tomate3))
    ;         (cortado ?tomate1)
    ;         (cortado ?tomate2)
    ;         (cortado ?tomate3)
    ;         (cocido3 ?tomate1 ?tomate2 ?tomate3)
    ;         (emplatado3 ?tomate1 ?tomate2 ?tomate3 ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (sopa-tomate ?plato)
    ;     )
    ; )

    ; (:action hacer-sopa-cebolla
    ;     :parameters (?plato - plato ?pila - pila ?cebolla1 ?cebolla2 ?cebolla3 - cebolla)
    ;     :precondition (and
    ;         (not (= ?cebolla1 ?cebolla2))
    ;         (not (= ?cebolla2 ?cebolla3))
    ;         (not (= ?cebolla1 ?cebolla3))
    ;         (cortado ?cebolla1)
    ;         (cortado ?cebolla2)
    ;         (cortado ?cebolla3)
    ;         (cocido3 ?cebolla1 ?cebolla2 ?cebolla3)
    ;         (emplatado3 ?cebolla1 ?cebolla2 ?cebolla3 ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (sopa-cebolla ?plato)
    ;     )
    ; )

    ; (:action hacer-sopa-champinion
    ;     :parameters (?plato - plato ?pila - pila ?champinion1 ?champinion2 ?champinion3 - champinion)
    ;     :precondition (and
    ;         (not (= ?champinion1 ?champinion2))
    ;         (not (= ?champinion2 ?champinion3))
    ;         (not (= ?champinion1 ?champinion3))
    ;         (cortado ?champinion1)
    ;         (cortado ?champinion2)
    ;         (cortado ?champinion3)
    ;         (cocido3 ?champinion1 ?champinion2 ?champinion3)
    ;         (emplatado3 ?champinion1 ?champinion2 ?champinion3 ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (sopa-champinion ?plato)
    ;     )
    ; )

    ; (:action hacer-pescado-frito
    ;     :parameters (?plato - plato ?pila - pila ?pescado - pescado)
    ;     :precondition (and
    ;         (cortado ?pescado)
    ;         (frito ?pescado)
    ;         (emplatado ?pescado ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?pescado ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (pescado-frito ?plato)
    ;     )
    ; )

    ; (:action hacer-patatas-fritas
    ;     :parameters (?plato - plato ?pila - pila ?patata - patata)
    ;     :precondition (and
    ;         (cortado ?patata)
    ;         (frito ?patata)
    ;         (emplatado ?patata ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?patata ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (patatas-fritas ?plato)
    ;     )
    ; )

    ; (:action hacer-fish-and-chips
    ;     :parameters (?plato - plato ?pila - pila ?pescado - pescado ?patata - patata)
    ;     :precondition (and
    ;         (cortado ?pescado)
    ;         (frito ?pescado)
    ;         (emplatado ?pescado ?plato)
    ;         (cortado ?patata)
    ;         (frito ?patata)
    ;         (emplatado ?patata ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?pescado ?plato))
    ;         (not (emplatado ?patata ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (fish-and-chips ?plato)
    ;     )
    ; )

    ; (:action hacer-burrito-pollo
    ;     :parameters (?plato - plato ?pila - pila ?tortita - tortita ?arroz - arroz ?pollo - pollo)
    ;     :precondition (and
    ;         (emplatado ?tortita ?plato)
    ;         (cocido ?arroz)
    ;         (emplatado ?arroz ?plato)
    ;         (cortado ?pollo)
    ;         (cocinado ?pollo)
    ;         (emplatado ?pollo ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?tortita ?plato))
    ;         (not (emplatado ?arroz ?plato))
    ;         (not (emplatado ?pollo ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (burrito-pollo ?plato)
    ;     )
    ; )

    ; (:action hacer-burrito-carne
    ;     :parameters (?plato - plato ?pila - pila ?tortita - tortita ?arroz - arroz ?carne - carne)
    ;     :precondition (and
    ;         (emplatado ?tortita ?plato)
    ;         (cocido ?arroz)
    ;         (emplatado ?arroz ?plato)
    ;         (cortado ?carne)
    ;         (cocinado ?carne)
    ;         (emplatado ?carne ?plato)
    ;         (entregado ?plato)
    ;     )
    ;     :effect (and
    ;         (not (emplatado ?tortita ?plato))
    ;         (not (emplatado ?arroz ?plato))
    ;         (not (emplatado ?carne ?plato))
    ;         (not (lleno ?plato))
    ;         (sucio ?plato)
    ;         (sobre ?plato ?pila)
    ;         (burrito-carne ?plato)
    ;     )
    ; )
)
