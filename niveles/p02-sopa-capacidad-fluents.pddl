(define (problem p02-sopa-capacidad-fluents)
    (:domain overcooked-sopa-capacidad-fluents)
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
        
        fogon-1 - fogon

        pila - pila
        entregador - entregador

        encimera-comun-1 - encimera
        encimera-comun-2 - encimera
        encimera-comun-3 - encimera
        encimera-comun-4 - encimera
        encimera-comun-5 - encimera
        encimera-comun-6 - encimera
        encimera-comun-7 - encimera
        encimera-comun-8 - encimera
        encimera-comun-9 - encimera

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

        cebolla-1 - cebolla
        cebolla-2 - cebolla
        cebolla-3 - cebolla
        cebolla-4 - cebolla
        cebolla-5 - cebolla
        cebolla-6 - cebolla
        armario-cebollas - armario

        plato-1 - plato
        plato-2 - plato
    )
    (:init
        (conectadas zona-1 zona-2)
        (conectadas zona-2 zona-1)

        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (pertenece limbo-2 zona-2)

        (pertenece tabla-1 zona-2)
        (pertenece tabla-2 zona-2)

        (pertenece fregadero zona-1)

        (pertenece fogon-1 zona-1)

        (pertenece pila zona-1)
        (pertenece entregador zona-1)

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
        (pertenece encimera-comun-7 zona-1)
        (pertenece encimera-comun-8 zona-1)
        (pertenece encimera-comun-9 zona-1)

        (pertenece encimera-comun-1 zona-2)
        (pertenece encimera-comun-2 zona-2)
        (pertenece encimera-comun-3 zona-2)
        (pertenece encimera-comun-4 zona-2)
        (pertenece encimera-comun-5 zona-2)
        (pertenece encimera-comun-6 zona-2)
        (pertenece encimera-comun-7 zona-2)
        (pertenece encimera-comun-8 zona-2)
        (pertenece encimera-comun-9 zona-2)

        (pertenece armario-cebollas zona-1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-cebollas)
        (prohibido-dejar entregador)

        (sobre multiolla-1 fogon-1)
        (vacio multiolla-1)
        (= (ingredientes multiolla-1) 0)
        (ocupada fogon-1)

        (sobre cebolla-1 armario-cebollas)
        (sobre cebolla-2 armario-cebollas)
        (sobre cebolla-3 armario-cebollas)
        (sobre cebolla-4 armario-cebollas)
        (sobre cebolla-5 armario-cebollas)
        (sobre cebolla-6 armario-cebollas)

        (sobre plato-1 encimera-zona2-9)
        (ocupada encimera-zona2-9)
        (vacio plato-1)
        (sobre plato-2 encimera-zona2-10)
        (ocupada encimera-zona2-10)
        (vacio plato-2)
    )
    (:goal (and
            (sopa-tomate plato-1)
            ; (sopa-cebolla plato-1)
        )
    )
)