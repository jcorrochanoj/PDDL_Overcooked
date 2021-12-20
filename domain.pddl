;; Overcooked V1 sequential
;;

(define (domain overcooked_v1)
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
        lechuga tomate pepino pescado gamba patata masa champinion - cortable
    )

    (:predicates
        (en ?personal - personal ?localizacion - localizacion)
        (sobre ?movible - movible ?localizacion - localizacion)
        (emplatado ?ingrediente - ingrediente ?plato - plato)
        (entregado ?plato - plato)
        (lleno ?plato - plato)
        (comido ?plato - plato)
        (echado ?ingrediente - ingrediente ?util - util)
        (libre ?personal - personal)
        (vacio ?util - util)
        (disponible ?localizacion - localizacion)
        (cortado ?cortable - cortable)
        (cocinado ?ingrediente - ingrediente)
        (cocinado-sarten ?ingrediente - ingrediente)
        (limpio ?lavable - lavable)
        (lleva ?cocinero - cocinero ?movible - movible)

        (ensalada-completa-echa)
    )

    (:functions
        (eleboraciones ?plato - plato)
    )

    (:action emplatar
        :parameters (?plato - plato ?encimera - encimera ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (limpio ?plato)
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?ingrediente))
            (emplatado ?ingrediente ?plato)
            (increase (eleboraciones ?plato) 1)
        )
    )

    (:action emplatar-util
        :parameters (?plato - plato ?encimera - encimera ?util - util ?ingrediente - ingrediente ?cocinero - cocinero)
        :precondition (and
            (limpio ?plato)
            (sobre ?plato ?encimera)
            (en ?cocinero ?encimera)
            (lleva ?cocinero ?util)
            (echado ?ingrediente ?util)
        )
        :effect (and
            (emplatado ?ingrediente ?plato)
            (not (echado ?ingrediente ?util))
            (vacio ?util)
            (not (limpio ?util))
            (increase (eleboraciones ?plato) 1)
        )
    )

    (:action echar
        :parameters (?ingrediente - ingrediente ?util - util ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (limpio ?util)
            (sobre ?util ?localizacion)
            (vacio ?util)
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?ingrediente)
        )
        :effect (and
            (libre ?cocinero)
            (not (lleva ?cocinero ?util))
            (not (vacio ?util))
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
        :parameters (?ingrediente - cortable ?tabla-corte - tabla-corte ?cocinero - cocinero)
        :precondition (and
            (not (cortado ?ingrediente))
            (sobre ?ingrediente ?tabla-corte)
            (en ?cocinero ?tabla-corte)
            (libre ?cocinero)
        )
        :effect (cortado ?ingrediente)
    )

    (:action lavar
        :parameters (?lavable - lavable ?fregadero - fregadero ?cocinero - cocinero)
        :precondition (and
            (sobre ?lavable ?fregadero)
            (en ?cocinero ?fregadero)
            (libre ?cocinero)
        )
        :effect (limpio ?lavable)
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
            (en ?cocinero ?localizacion)
            (libre ?cocinero)
            (sobre ?movible ?localizacion)
        )
        :effect (and
            (disponible ?localizacion)
            (not (sobre ?movible ?localizacion))
            (lleva ?cocinero ?movible)
            (not (libre ?cocinero))
        )
    )

    (:action dejar
        :parameters (?movible - movible ?localizacion - localizacion ?cocinero - cocinero)
        :precondition (and
            (disponible ?localizacion)
            (en ?cocinero ?localizacion)
            (lleva ?cocinero ?movible)
        )
        :effect (and
            (not (disponible ?localizacion))
            (sobre ?movible ?localizacion)
            (not (lleva ?cocinero ?movible))
            (libre ?cocinero)
        )
    )

    (:action entregar
        :parameters (?plato - plato ?entregador - entregador ?cocinero - cocinero)
        :precondition (and
            (limpio ?plato)
            (en ?cocinero ?entregador)
            (lleva ?cocinero ?plato)
        )
        :effect (and
            (entregado ?plato)
            (not (lleva ?cocinero ?plato))
            (libre ?cocinero)
        )
    )
     
    (:action comer
        :parameters (?plato - plato ?pila - pila)
        :precondition (and
            (entregado ?plato)
        )
        :effect (and
            (not (lleno ?plato))
            (comido ?plato)
            (not (limpio ?plato))
            (sobre ?plato ?pila)
        )
    )

     (:action ensalada-completa
        :parameters (?plato - plato ?lechuga - lechuga ?tomate - tomate ?pepino - pepino)
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
            (ensalada-completa-echa)
        )
    )
)
