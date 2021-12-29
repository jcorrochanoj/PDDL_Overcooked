(define (problem p01-ensalada)
    (:domain overcooked-ensalada)
    (:objects
        zona-1 - zona
        limbo-1 - limbo
        zona-2 - zona
        limbo-2 - limbo

        cocinero-1 - cocinero
        cocinero-2 - cocinero

        tabla-1 - tabla-corte
        tabla-2 - tabla-corte

        fregadero - fregadero

        pila - pila
        entregador - entregador

        encimera-comun-1 - encimera
        encimera-comun-2 - encimera
        encimera-comun-3 - encimera
        encimera-comun-4 - encimera
        encimera-comun-5 - encimera
        encimera-comun-6 - encimera

        encimera-zona1-1 - encimera
        encimera-zona1-2 - encimera
        encimera-zona1-3 - encimera
        encimera-zona1-4 - encimera
        encimera-zona1-5 - encimera
        encimera-zona1-6 - encimera
        encimera-zona1-7 - encimera
        encimera-zona1-8 - encimera
        encimera-zona1-9 - encimera
        encimera-zona1-10 - encimera

        encimera-zona2-1 - encimera
        encimera-zona2-2 - encimera
        encimera-zona2-3 - encimera
        encimera-zona2-4 - encimera
        encimera-zona2-5 - encimera
        encimera-zona2-6 - encimera
        encimera-zona2-7 - encimera
        encimera-zona2-8 - encimera
        encimera-zona2-9 - encimera
        encimera-zona2-10 - encimera

        lechuga-1 - lechuga
        lechuga-2 - lechuga
        lechuga-3 - lechuga
        lechuga-4 - lechuga
        lechuga-5 - lechuga
        lechuga-6 - lechuga
        lechuga-7 - lechuga
        lechuga-8 - lechuga
        armario-lechugas - armario

        tomate-1 - tomate
        tomate-2 - tomate
        tomate-3 - tomate
        tomate-4 - tomate
        tomate-5 - tomate
        armario-tomates - armario

        plato-1 - plato
        plato-2 - plato
        plato-3 - plato
        plato-4 - plato
        plato-5 - plato
        armario-platos - armario
    )
    (:init
        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (esta cocinero-2 zona-2)
        (pertenece limbo-2 zona-2)
        (en cocinero-2 limbo-2)
        (libre cocinero-2)

        (pertenece tabla-1 zona-1)
        (pertenece tabla-2 zona-1)

        (pertenece pila zona-2)
        (pertenece entregador zona-2)

        (pertenece encimera-zona1-1 zona-1)
        (pertenece encimera-zona1-2 zona-1)
        (pertenece encimera-zona1-3 zona-1)
        (pertenece encimera-zona1-4 zona-1)
        (pertenece encimera-zona1-5 zona-1)
        (pertenece encimera-zona1-6 zona-1)
        (pertenece encimera-zona1-7 zona-1)
        (pertenece encimera-zona1-8 zona-1)
        (pertenece encimera-zona1-9 zona-1)
        (pertenece encimera-zona1-10 zona-1)

        (pertenece encimera-zona2-1 zona-2)
        (pertenece encimera-zona2-2 zona-2)
        (pertenece encimera-zona2-3 zona-2)
        (pertenece encimera-zona2-4 zona-2)
        (pertenece encimera-zona2-5 zona-2)
        (pertenece encimera-zona2-6 zona-2)
        (pertenece encimera-zona2-7 zona-2)
        (pertenece encimera-zona2-8 zona-2)
        (pertenece encimera-zona2-9 zona-2)
        (pertenece encimera-zona2-10 zona-2)

        (pertenece encimera-comun-1 zona-1)
        (pertenece encimera-comun-2 zona-1)
        (pertenece encimera-comun-3 zona-1)
        (pertenece encimera-comun-4 zona-1)
        (pertenece encimera-comun-5 zona-1)
        (pertenece encimera-comun-6 zona-1)

        (pertenece encimera-comun-1 zona-2)
        (pertenece encimera-comun-2 zona-2)
        (pertenece encimera-comun-3 zona-2)
        (pertenece encimera-comun-4 zona-2)
        (pertenece encimera-comun-5 zona-2)
        (pertenece encimera-comun-6 zona-2)

        (pertenece armario-lechugas zona-2)
        (pertenece armario-tomates zona-2)
        (pertenece armario-platos zona-2)

        (prohibido-dejar pila)
        (prohibido-dejar armario-lechugas)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

        (sobre lechuga-1 armario-lechugas)
        (sobre lechuga-2 armario-lechugas)
        (sobre lechuga-3 armario-lechugas)
        (sobre lechuga-4 armario-lechugas)
        (sobre lechuga-5 armario-lechugas)
        (sobre lechuga-6 armario-lechugas)
        (sobre lechuga-7 armario-lechugas)
        (sobre lechuga-8 armario-lechugas)

        (sobre tomate-1 armario-tomates)
        (sobre tomate-2 armario-tomates)
        (sobre tomate-3 armario-tomates)
        (sobre tomate-4 armario-tomates)
        (sobre tomate-5 armario-tomates)

        (sobre plato-1 armario-platos)
        (vacio plato-1)
        (sobre plato-2 armario-platos)
        (vacio plato-2)
        (sobre plato-3 armario-platos)
        (vacio plato-3)
        (sobre plato-4 armario-platos)
        (vacio plato-4)
        (sobre plato-5 armario-platos)
        (vacio plato-5)
    )
    (:goal (and
            ; (ensalada plato-1)
            (ensalada-lechuga-tomate plato-1)
            ; (ensalada-lechuga plato-2)
            ; (ensalada plato-2)
        )
    )
)