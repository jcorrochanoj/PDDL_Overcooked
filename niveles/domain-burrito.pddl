(define (domain overcooked-burrito)
    (:requirements :typing :negative-preconditions :equality)
    (:types
        util ingrediente cocinero zona localizacion movible lavable cortable - object
        carne pollo tortita arroz - ingrediente
        cambiador limbo encimera cinta tabla-corte fogon fregadero pila entregador armario - localizacion
        olla sarten - util
        util plato ingrediente - movible
        util plato - lavable
        capacidad-numero - object
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
        (echado ?ingrediente - ingrediente ?util - util)
        (cortado ?ingrediente - ingrediente)
        (cocido ?ingrediente - ingrediente)
        (cocinado ?ingrediente - ingrediente)
        (frito ?ingrediente - ingrediente)

        (burrito-pollo ?plato)
        (burrito-carne ?plato)
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
            (emplatado ?ingrediente ?plato)
        )
    )

    (:action emplatar-util
        :parameters (?cocinero - cocinero ?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente)
        :precondition (and
            (sobre ?plato ?encimera)
            (not (sucio ?plato))
            (en ?cocinero ?encimera)
            (not (vacio ?util))
            (lleva ?cocinero ?util)
            (echado ?ingrediente ?util)
        )
        :effect (and
            (not (echado ?ingrediente ?util))
            (vacio ?util)
            (sucio ?util)
            (not (vacio ?plato))
            (emplatado ?ingrediente ?plato)
        )
    )

    (:action echar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?util - util ?localizacion - localizacion)
        :precondition (and
            (sobre ?util ?localizacion)
            (vacio ?util)
            (not (sucio ?util))
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (not (vacio ?util))
            (echado ?ingrediente ?util)
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

    (:action cocer
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?olla - olla ?fogon - fogon)
        :precondition (and
            (echado ?ingrediente ?olla)
            (sobre ?olla ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocido ?ingrediente)
    )

    (:action cocinar
        :parameters (?cocinero - cocinero ?ingrediente - ingrediente ?sarten - sarten ?fogon - fogon)
        :precondition (and
            (echado ?ingrediente ?sarten)
            (sobre ?sarten ?fogon)
            (en ?cocinero ?fogon)
            (libre ?cocinero)
        )
        :effect (cocinado ?ingrediente)
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
            ;; OJO!!!!! Si se usa sucio fast-downward funciona pero si se usa vacio tarda muchisimo
            (not (sucio ?plato))
            ; (not (vacio ?plato))
            (lleva ?cocinero ?plato)
        )
        :effect (and
            (entregado ?plato)
            (not (lleva ?cocinero ?plato))
            (libre ?cocinero)
        )
    )

    (:action hacer-burrito-pollo
        :parameters (?plato - plato ?pila - pila ?tortita - tortita ?arroz - arroz ?pollo - pollo)
        :precondition (and
            (emplatado ?tortita ?plato)
            (cocido ?arroz)
            (emplatado ?arroz ?plato)
            (cortado ?pollo)
            (cocinado ?pollo)
            (emplatado ?pollo ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (emplatado ?tortita ?plato))
            (not (emplatado ?arroz ?plato))
            (not (emplatado ?pollo ?plato))
            (vacio ?plato)
            (sucio ?plato)
            (sobre ?plato ?pila)
            (burrito-pollo ?plato)
        )
    )

    (:action hacer-burrito-carne
        :parameters (?plato - plato ?pila - pila ?tortita - tortita ?arroz - arroz ?carne - carne)
        :precondition (and
            (emplatado ?tortita ?plato)
            (cocido ?arroz)
            (emplatado ?arroz ?plato)
            (cortado ?carne)
            (cocinado ?carne)
            (emplatado ?carne ?plato)
            (entregado ?plato)
        )
        :effect (and
            (not (emplatado ?tortita ?plato))
            (not (emplatado ?arroz ?plato))
            (not (emplatado ?carne ?plato))
            (vacio ?plato)
            (sucio ?plato)
            (sobre ?plato ?pila)
            (burrito-carne ?plato)
        )
    )
)
