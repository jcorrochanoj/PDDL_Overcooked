(define (problem p04-sopa-capacidad-fluents)
    (:domain overcooked-sopa-capacidad-fluents)
    (:objects
        zona-1 - zona
        limbo-1 - limbo
        zona-2 - zona
        limbo-2 - limbo

        cocinero-1 - cocinero

        tabla-1 - tabla-corte
        tabla-2 - tabla-corte

        multiolla-1 - multiolla
        multiolla-2 - multiolla
        fogon-1 - fogon
        fogon-2 - fogon

        pila - pila
        entregador - entregador

        encimera-comun1-1 - encimera
        encimera-comun1-2 - encimera
        encimera-comun1-3 - encimera
        encimera-comun1-4 - encimera

        encimera-comun2-1 - encimera
        encimera-comun2-2 - encimera
        encimera-comun2-3 - encimera
        encimera-comun2-4 - encimera
        encimera-comun2-5 - encimera

        encimera-zona1-1 - encimera
        encimera-zona1-2 - encimera
        encimera-zona1-3 - encimera

        encimera-zona2-1 - encimera

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

        champinion-1 - champinion
        champinion-2 - champinion
        champinion-3 - champinion
        champinion-4 - champinion
        champinion-5 - champinion
        champinion-6 - champinion
        armario-champiniones - armario

        plato-1 - plato
        plato-2 - plato
        plato-3 - plato
    )
    (:init
        (conectadas zona-1 zona-2)
        (conectadas zona-2 zona-1)

        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (pertenece limbo-2 zona-2)

        (pertenece tabla-1 zona-1)
        (pertenece tabla-2 zona-1)

        (pertenece fogon-1 zona-1)
        (pertenece fogon-2 zona-1)

        (pertenece pila zona-2)
        (pertenece entregador zona-2)

        (pertenece encimera-zona1-1 zona-1)
        (pertenece encimera-zona1-2 zona-1)
        (pertenece encimera-zona1-3 zona-1)

        (pertenece encimera-zona2-1 zona-2)

        (pertenece encimera-comun1-1 zona-1)
        (pertenece encimera-comun1-2 zona-1)
        (pertenece encimera-comun1-3 zona-1)
        (pertenece encimera-comun1-4 zona-1)

        (pertenece encimera-comun2-1 zona-1)
        (pertenece encimera-comun2-2 zona-1)
        (pertenece encimera-comun2-3 zona-1)
        (pertenece encimera-comun2-4 zona-1)
        (pertenece encimera-comun2-5 zona-1)

        (pertenece encimera-comun2-1 zona-2)
        (pertenece encimera-comun2-2 zona-2)
        (pertenece encimera-comun2-3 zona-2)
        (pertenece encimera-comun2-4 zona-2)
        (pertenece encimera-comun2-5 zona-2)

        (pertenece armario-tomates zona-2)
        (pertenece armario-cebollas zona-2)
        (pertenece armario-champiniones zona-2)

        (prohibido-dejar pila)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-cebollas)
        (prohibido-dejar armario-champiniones)
        (prohibido-dejar entregador)

        (sobre multiolla-1 fogon-1)
        (= (ingredientes multiolla-1) 0)
        (vacio multiolla-1)
        (ocupada fogon-1)

        (sobre multiolla-2 fogon-2)
        (= (ingredientes multiolla-2) 0)
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

        (sobre champinion-1 armario-champiniones)
        (sobre champinion-2 armario-champiniones)
        (sobre champinion-3 armario-champiniones)
        (sobre champinion-4 armario-champiniones)
        (sobre champinion-5 armario-champiniones)
        (sobre champinion-6 armario-champiniones)

        (sobre plato-1 encimera-comun1-2)
        (ocupada encimera-comun1-2)
        (vacio plato-1)
        (sobre plato-2 encimera-comun1-3)
        (ocupada encimera-comun1-3)
        (vacio plato-2)
        (sobre plato-3 encimera-comun1-4)
        (ocupada encimera-comun1-4)
        (vacio plato-3)
    )
    (:goal (and
            (sopa-tomate plato-1)
            (sopa-cebolla plato-1)
        )
    )
)