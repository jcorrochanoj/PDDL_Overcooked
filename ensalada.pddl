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
        lechuga7 - lechuga
        lechuga8 - lechuga
        lechuga9 - lechuga
        lechuga10 - lechuga
        armario-lechugas - armario

        tomate1 - tomate
        tomate2 - tomate
        tomate3 - tomate
        tomate4 - tomate
        tomate5 - tomate
        tomate6 - tomate
        tomate7 - tomate
        tomate8 - tomate
        armario-tomates - armario

        pepino1 - pepino
        pepino2 - pepino
        pepino3 - pepino
        pepino4 - pepino
        pepino5 - pepino
        armario-pepinos - armario

        plato1 - plato
        plato2 - plato
        armario-platos - armario


        ; capacidad0 - capacidad-numero
        ; capacidad1 - capacidad-numero
        ; capacidad2 - capacidad-numero
        ; capacidad3 - capacidad-numero
        ; capacidad4 - capacidad-numero
    )
    (:init
        ; (siguiente capacidad0 capacidad1)
        ; (siguiente capacidad1 capacidad2)
        ; (siguiente capacidad2 capacidad3)
        ; (siguiente capacidad3 capacidad4)
        ; (inicial capacidad0)

        ; (capacidad plato1 capacidad0)
        ; (capacidad plato2 capacidad0)

        (puede-acceder cocinero1 zona1)
        (pertenece limbo1 zona1)
        (en cocinero1 limbo1)
        (libre cocinero1)

        (puede-acceder cocinero2 zona2)
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
        
        (prohibido-usar pila)
        (prohibido-usar fregadero)

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
        (sobre lechuga8 armario-lechugas)
        (sobre lechuga9 armario-lechugas)
        (sobre lechuga9 armario-lechugas)
        (sobre lechuga10 armario-lechugas)

        (sobre tomate1 armario-tomates)
        (sobre tomate2 armario-tomates)
        (sobre tomate3 armario-tomates)
        (sobre tomate4 armario-tomates)
        (sobre tomate5 armario-tomates)
        (sobre tomate6 armario-tomates)
        (sobre tomate7 armario-tomates)
        (sobre tomate8 armario-tomates)

        (sobre pepino1 armario-pepinos)
        (sobre pepino2 armario-pepinos)
        (sobre pepino3 armario-pepinos)
        (sobre pepino4 armario-pepinos)
        (sobre pepino5 armario-pepinos)

        (sobre plato1 armario-platos)
        (sobre plato2 armario-platos)
    )
    (:goal (and
            (ensalada plato1)
            ; (ensalada-lechuga-tomate plato1)
            ; (ensalada-lechuga plato2)
            ; (ensalada plato2)
        )
    )
)