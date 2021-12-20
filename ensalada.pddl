(define (problem ensalada)
    (:domain overcooked)
    (:objects
        cocinero - cocinero

        tabla1 - tabla-corte

        fregadero - fregadero

        fogon1 - fogon
        fogon2 - fogon

        pila - pila
        entregador - entregador

        sarten1 - sarten

        encimera1 - encimera
        encimera2 - encimera
        encimera3 - encimera
        encimera4 - encimera

        lechuga1 - lechuga
        lechuga2 - lechuga
        lechuga3 - lechuga
        lechuga4 - lechuga
        lechuga5 - lechuga
        lechuga6 - lechuga
        armario-lechugas - armario

        tomate1 - tomate
        tomate2 - tomate
        tomate3 - tomate
        tomate4 - tomate
        tomate5 - tomate
        tomate6 - tomate
        armario-tomates - armario

        pepino1 - pepino
        pepino2 - pepino
        pepino3 - pepino
        pepino4 - pepino
        pepino5 - pepino
        pepino6 - pepino
        armario-pepinos - armario

        plato1 - plato
        plato2 - plato
        armario-platos - armario
    )
    (:init
        (en cocinero fregadero)
        (libre cocinero)

        (sobre sarten1 encimera1)
        (ocupada encimera1)

        ; (forall (?lechuga - lechuga) 
        ;     (sobre ?lechuga armario-lechugas)
        ; )
        (sobre lechuga1 armario-lechugas)
        (sobre lechuga2 armario-lechugas)
        (sobre lechuga3 armario-lechugas)
        (sobre lechuga4 armario-lechugas)
        (sobre lechuga5 armario-lechugas)
        (sobre lechuga6 armario-lechugas)

        (sobre tomate1 armario-tomates)
        (sobre tomate2 armario-tomates)
        (sobre tomate3 armario-tomates)
        (sobre tomate4 armario-tomates)
        (sobre tomate5 armario-tomates)
        (sobre tomate6 armario-tomates)

        (sobre pepino1 armario-pepinos)
        (sobre pepino2 armario-pepinos)
        (sobre pepino3 armario-pepinos)
        (sobre pepino4 armario-pepinos)
        (sobre pepino5 armario-pepinos)
        (sobre pepino6 armario-pepinos)

        (sobre plato1 armario-platos)
        (sobre plato2 armario-platos)

        (prohibido-usar pila)
        (prohibido-usar fregadero)

        (prohibido-dejar pila)
        (prohibido-dejar armario-lechugas)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-pepinos)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

        (prohibido-coger entregador)
    )
    (:goal
        (ensalada-completa-hecha plato1)
    )
)