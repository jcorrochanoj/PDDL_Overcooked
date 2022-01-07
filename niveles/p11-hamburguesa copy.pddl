(define (problem p11-hamburguesa)
    (:domain overcooked-hamburguesa)
    (:objects
        zona-1 - zona
        limbo-1 - limbo
        zona-2 - zona
        limbo-2 - limbo

        cocinero-1 - cocinero
        cocinero-2 - cocinero

        tabla-1 - tabla-corte
        tabla-2 - tabla-corte

        sarten-1 - sarten
        sarten-2 - sarten
        sarten-3 - sarten

        fogon-1 - fogon
        fogon-2 - fogon
        fogon-3 - fogon

        tostadora-1 - tostadora

        fregadero - fregadero

        pila - pila
        entregador - entregador

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

        encimera-comun1-1 - encimera
        encimera-comun1-2 - encimera
        encimera-comun1-3 - encimera

        encimera-comun2-1 - encimera
        encimera-comun2-2 - encimera
        encimera-comun2-3 - encimera

        lechuga-1 - lechuga
        lechuga-2 - lechuga
        lechuga-3 - lechuga
        lechuga-4 - lechuga
        lechuga-5 - lechuga
        armario-lechugas - armario

        tomate-1 - tomate
        tomate-2 - tomate
        tomate-3 - tomate
        armario-tomates - armario

        pan-1 - pan
        pan-2 - pan
        pan-3 - pan
        pan-4 - pan
        pan-5 - pan
        pan-6 - pan
        pan-7 - pan
        pan-8 - pan
        armario-panes - armario

        carne-1 - carne
        carne-2 - carne
        carne-3 - carne
        carne-4 - carne
        carne-5 - carne
        carne-6 - carne
        carne-7 - carne
        carne-8 - carne
        armario-carnes - armario

        plato-1 - plato
        plato-2 - plato
        plato-3 - plato
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

        (pertenece fogon-1 zona-2)
        (pertenece fogon-2 zona-2)
        (pertenece fogon-3 zona-2)

        (pertenece tostadora-1 zona-2)

        (pertenece fregadero zona-2)

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

        (pertenece encimera-comun1-1 zona-1)
        (pertenece encimera-comun1-2 zona-1)
        (pertenece encimera-comun1-3 zona-1)

        (pertenece encimera-comun1-1 zona-2)
        (pertenece encimera-comun1-2 zona-2)
        (pertenece encimera-comun1-3 zona-2)

        (pertenece encimera-comun2-1 zona-1)
        (pertenece encimera-comun2-2 zona-1)
        (pertenece encimera-comun2-3 zona-1)

        (pertenece encimera-comun2-1 zona-2)
        (pertenece encimera-comun2-2 zona-2)
        (pertenece encimera-comun2-3 zona-2)

        (pertenece armario-lechugas zona-2)
        (pertenece armario-tomates zona-2)
        (pertenece armario-panes zona-2)
        (pertenece armario-carnes zona-2)

        (prohibido-dejar pila)
        (prohibido-dejar armario-lechugas)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-panes)
        (prohibido-dejar armario-carnes)
        (prohibido-dejar entregador)

        (sobre sarten-1 fogon-1)
        (vacio sarten-1)
        (ocupada fogon-1)
        (sobre sarten-2 fogon-2)
        (vacio sarten-2)
        (ocupada fogon-2)
        (sobre sarten-3 fogon-3)
        (vacio sarten-3)
        (ocupada fogon-3)

        (sobre lechuga-1 armario-lechugas)
        (sobre lechuga-2 armario-lechugas)
        (sobre lechuga-3 armario-lechugas)
        (sobre lechuga-4 armario-lechugas)
        (sobre lechuga-5 armario-lechugas)

        (sobre tomate-1 armario-tomates)
        (sobre tomate-2 armario-tomates)
        (sobre tomate-3 armario-tomates)

        (sobre pan-1 armario-panes)
        (sobre pan-2 armario-panes)
        (sobre pan-3 armario-panes)
        (sobre pan-4 armario-panes)
        (sobre pan-5 armario-panes)
        (sobre pan-6 armario-panes)
        (sobre pan-7 armario-panes)
        (sobre pan-8 armario-panes)

        (sobre carne-1 armario-carnes)
        (sobre carne-2 armario-carnes)
        (sobre carne-3 armario-carnes)
        (sobre carne-3 armario-carnes)
        (sobre carne-4 armario-carnes)
        (sobre carne-6 armario-carnes)
        (sobre carne-7 armario-carnes)
        (sobre carne-8 armario-carnes)

        (sobre plato-1 encimera-zona1-1)
        (ocupada encimera-zona1-1)
        (vacio plato-1)
        (sobre plato-2 encimera-zona1-2)
        (ocupada encimera-zona1-2)
        (vacio plato-2)
        (sobre plato-3 encimera-zona1-3)
        (ocupada encimera-zona1-3)
        (vacio plato-3)
    )
    (:goal (and
            (hamburguesa-simple plato-1)
            ; (hamburguesa-lechuga plato-2)
            ; (hamburguesa plato-1)
        )
    )
)