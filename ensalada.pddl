(define (problem ensalada)
    (:domain overcooked)
    (:objects
        zona1 - zona
        limbo1 - limbo
        zona2 - zona
        limbo2 - limbo

        cocinero1 - cocinero
        cocinero2 - cocinero

        tabla1 - tabla-corte

        fregadero - fregadero

        inusable1 - sarten
        inusable2 - multiolla

        pila - pila
        entregador - entregador

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
        armario-tomates - armario

        pepino1 - pepino
        pepino2 - pepino
        pepino3 - pepino
        armario-pepinos - armario

        plato1 - plato
        plato2 - plato
        armario-platos - armario
    )
    (:init
        (esta cocinero1 zona1)
        (pertenece limbo1 zona1)
        (en cocinero1 limbo1)
        (libre cocinero1)

        (esta cocinero2 zona2)
        (pertenece limbo2 zona2)
        (en cocinero2 limbo2)
        (libre cocinero2)

        (pertenece tabla1 zona2)
        (pertenece fregadero zona1)
        (pertenece pila zona1)
        (pertenece entregador zona2)
        (pertenece encimera1 zona1)
        (pertenece encimera2 zona1)
        (pertenece encimera2 zona2)
        (pertenece encimera3 zona1)
        (pertenece encimera3 zona2)
        (pertenece encimera4 zona1)
        (pertenece armario-lechugas zona1)
        (pertenece armario-tomates zona1)
        (pertenece armario-pepinos zona1)
        (pertenece armario-platos zona1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-lechugas)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-pepinos)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

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

        (sobre pepino1 armario-pepinos)
        (sobre pepino2 armario-pepinos)
        (sobre pepino3 armario-pepinos)

        (sobre plato1 armario-platos)
        (vacio plato1)
        (sobre plato2 armario-platos)
        (vacio plato2)
    )
    (:goal (and
            ; (ensalada plato1)
            (ensalada-lechuga-tomate plato1)
            ; (ensalada-lechuga plato2)
            ; (ensalada plato2)
        )
    )
)