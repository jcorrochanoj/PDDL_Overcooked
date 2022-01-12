(define (domain overcooked-ensalada)
    (:requirements :typing :negative-preconditions :equality :fluents)
    (:types
        ingrediente cocinero zona localizacion movible lavable cortable - object
        lechuga tomate pepino - ingrediente
        cambiador limbo encimera tabla-corte fregadero pila entregador armario - localizacion
        plato ingrediente - movible
        plato - lavable
    )

    (:predicates
        (en ?cocinero - cocinero ?localizacion - localizacion)
        (pertenece ?localizacion - localizacion ?zona - zona)
        (esta ?cocinero - cocinero ?zona - zona)
        (conectadas ?zona1 ?zona2 - zona)
        (libre ?cocinero - cocinero)
        (lleva ?cocinero - cocinero ?movible - movible)

        (ocupada ?localizacion - localizacion)

        (sobre ?movible - movible ?localizacion - localizacion)
        (prohibido-dejar ?localizacion - localizacion)

        (entregado ?plato - plato)
        (sucio ?lavable - lavable)
        (vacio ?lavable - lavable)

        (emplatado ?ingrediente - ingrediente ?plato - plato)
        (cortado ?ingrediente - ingrediente)

        (ensalada-lechuga ?plato - plato)
        (ensalada-lechuga-tomate ?plato - plato)
        (ensalada ?plato - plato)
    )

    (:functions
        (ingredientes ?lavable - lavable) - number
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
            (not (vacio ?plato))
            (increase (ingredientes ?plato) 1)
            (emplatado ?ingrediente ?plato)
        )
    )

    (:action cortar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?tabla-corte - tabla-corte)
        :precondition (and
            (sobre ?ingrediente ?tabla-corte)
            (en ?cocinero ?tabla-corte)
            (libre ?cocinero)
        )
        :effect (cortado ?ingrediente)
    )

    (:action lavar
        :parameters (?cocinero - cocinero ?lavable - lavable ?fregadero - fregadero)
        :precondition (and
            (vacio ?lavable)
            (sobre ?lavable ?fregadero)
            (en ?cocinero ?fregadero)
            (libre ?cocinero)
        )
        :effect (not (sucio ?lavable))
    )

    (:action mover
        :parameters (?cocinero - cocinero ?l1 ?l2 - localizacion ?zona - zona)
        :precondition (and
            (en ?cocinero ?l1)
            (pertenece ?l2 ?zona)
            (esta ?cocinero ?zona)
        )
        :effect (and
            (not (en ?cocinero ?l1))
            (en ?cocinero ?l2)
        )
    )

    (:action cambiar
        :parameters (?cocinero - cocinero ?limbo1 ?limbo2 - limbo ?zona1 ?zona2 - zona)
        :precondition (and
            (en ?cocinero ?limbo1)
            (pertenece ?limbo1 ?zona1)
            (not (pertenece ?limbo1 ?zona2))
            (pertenece ?limbo2 ?zona2)
            (not (pertenece ?limbo2 ?zona1))
            (esta ?cocinero ?zona1)
            (conectadas ?zona1 ?zona2)
        )
        :effect (and
            (not (en ?cocinero ?limbo1))
            (not (esta ?cocinero ?zona1))
            (en ?cocinero ?limbo2)
            (esta ?cocinero ?zona2)
        )
    )

    ; (:action cambiar-zona
    ;     :parameters (?cocinero1 ?cocinero2 - cocinero ?cambiador - cambiador ?zona1 ?zona2 - zona ?zona-intercambio - zona-intercambio)
    ;     :precondition (and
    ;         (en ?cocinero1 ?cambiador)
    ;         (pertenece ?cambiador ?zona1)
    ;         (not (pertenece ?cambiador ?zona2))
    ;         (not (pertenece ?cambiador ?zona-intercambio))

    ;         (esta ?cocinero1 ?zona1)
    ;         (esta ?cocinero1 ?zona-intercambio)
    ;         (not (esta ?cocinero1 ?zona2))

    ;         (not (esta ?cocinero2 ?zona1))
    ;         (not (esta ?cocinero2 ?zona-intercambio))
    ;         (esta ?cocinero2 ?zona2)
    ;     )
    ;     :effect (and
    ;         (not (esta ?cocinero1 ?zona-intercambio))
    ;         (esta ?cocinero2 ?zona-intercambio)
    ;     )
    ; )

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
        )
    )

    (:action entregar
        :parameters (?cocinero - cocinero ?plato - plato ?entregador - entregador)
        :precondition (and
            (en ?cocinero ?entregador)
            (not (sucio ?plato))
            (lleva ?cocinero ?plato)
        )
        :effect (and
            (entregado ?plato)
            (not (lleva ?cocinero ?plato))
            (libre ?cocinero)
        )
    )

    (:action hacer-ensalada-lechuga
        :parameters (?plato - plato ?pila - pila ?lechuga - lechuga)
        :precondition (and
            (cortado ?lechuga)
            (emplatado ?lechuga ?plato)
            (entregado ?plato)
            (not (sucio ?plato))
            (= (ingredientes ?plato) 1)
        )
        :effect (and
            (not (emplatado ?lechuga ?plato))
            (not (entregado ?plato))
            (vacio ?plato)
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (ingredientes ?plato) 0)
            (ensalada-lechuga ?plato)
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
            (not (sucio ?plato))
            (= (ingredientes ?plato) 2)
        )
        :effect (and
            (not (emplatado ?lechuga ?plato))
            (not (emplatado ?tomate ?plato))
            (not (entregado ?plato))
            (vacio ?plato)
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (ingredientes ?plato) 0)
            (ensalada-lechuga-tomate ?plato)
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
            (not (sucio ?plato))
            (= (ingredientes ?plato) 3)
        )
        :effect (and
            (not (emplatado ?lechuga ?plato))
            (not (emplatado ?tomate ?plato))
            (not (emplatado ?pepino ?plato))
            (not (entregado ?plato))
            (vacio ?plato)
            (sucio ?plato)
            (sobre ?plato ?pila)
            (assign (ingredientes ?plato) 0)
            (ensalada ?plato)
        )
    )
)
