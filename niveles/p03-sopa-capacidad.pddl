(define (problem p03-sopa-capacidad)
    (:domain overcooked-sopa-capacidad)
    (:objects
        zona-1 - zona
        limbo-1 - limbo
        zona-2 - zona
        limbo-2 - limbo

        cocinero-1 - cocinero

        tabla-1 - tabla-corte
        tabla-2 - tabla-corte

        fregadero - fregadero

        multiolla-1 - multiolla
        multiolla-2 - multiolla
        fogon-1 - fogon
        fogon-2 - fogon

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

        encimera-zona2-1 - encimera
        encimera-zona2-2 - encimera
        encimera-zona2-3 - encimera
        encimera-zona2-4 - encimera
        encimera-zona2-5 - encimera
        encimera-zona2-6 - encimera

        tomate-1 - tomate
        tomate-2 - tomate
        tomate-3 - tomate
        tomate-4 - tomate
        tomate-5 - tomate
        tomate-6 - tomate
        armario-tomates - armario

        cebolla-1 - cebolla
        cebolla-2 - cebolla
        cebolla-3 - cebolla
        cebolla-4 - cebolla
        cebolla-5 - cebolla
        cebolla-6 - cebolla
        armario-cebollas - armario

        plato-1 - plato
        plato-2 - plato

        capacidad-0 - capacidad-numero
        capacidad-1 - capacidad-numero
        capacidad-2 - capacidad-numero
        capacidad-3 - capacidad-numero
    )
    (:init
        (siguiente capacidad-0 capacidad-1)
        (siguiente capacidad-1 capacidad-2)
        (siguiente capacidad-2 capacidad-3)

        (conectadas zona-1 zona-2)
        (conectadas zona-2 zona-1)

        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (pertenece limbo-2 zona-2)

        (pertenece tabla-1 zona-1)
        (pertenece tabla-2 zona-1)

        (pertenece fregadero zona-1)

        (pertenece fogon-1 zona-1)
        (pertenece fogon-2 zona-1)

        (pertenece pila zona-2)
        (pertenece entregador zona-2)

        (pertenece encimera-zona1-1 zona-1)
        (pertenece encimera-zona1-2 zona-1)
        (pertenece encimera-zona1-3 zona-1)
        (pertenece encimera-zona1-4 zona-1)
        (pertenece encimera-zona1-5 zona-1)
        (pertenece encimera-zona1-6 zona-1)

        (pertenece encimera-zona2-1 zona-2)
        (pertenece encimera-zona2-2 zona-2)
        (pertenece encimera-zona2-3 zona-2)
        (pertenece encimera-zona2-4 zona-2)
        (pertenece encimera-zona2-5 zona-2)
        (pertenece encimera-zona2-6 zona-2)

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

        (pertenece armario-tomates zona-2)
        (pertenece armario-cebollas zona-2)

        (prohibido-dejar pila)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-cebollas)
        (prohibido-dejar entregador)

        (sobre multiolla-1 fogon-1)
        (capacidad multiolla-1 capacidad-3)
        (vacio multiolla-1)
        (ocupada fogon-1)

        (sobre multiolla-2 fogon-2)
        (capacidad multiolla-2 capacidad-3)
        (vacio multiolla-2)
        (ocupada fogon-2)

        (sobre tomate-1 armario-tomates)
        (sobre tomate-2 armario-tomates)
        (sobre tomate-3 armario-tomates)
        (sobre tomate-4 armario-tomates)
        (sobre tomate-5 armario-tomates)
        (sobre tomate-6 armario-tomates)

        (sobre cebolla-1 armario-cebollas)
        (sobre cebolla-2 armario-cebollas)
        (sobre cebolla-3 armario-cebollas)
        (sobre cebolla-4 armario-cebollas)
        (sobre cebolla-5 armario-cebollas)
        (sobre cebolla-6 armario-cebollas)

        (sobre plato-1 encimera-comun-3)
        (ocupada encimera-comun-3)
        (vacio plato-1)
        (sobre plato-2 encimera-comun-4)
        (ocupada encimera-comun-4)
        (vacio plato-2)
    )
    (:goal (and
            (sopa-tomate plato-1)
            (sopa-cebolla plato-1)
        )
    )
)