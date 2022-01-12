(define (problem hamburguesa)
    (:domain overcooked)
    (:objects
        zona1 - zona
        limbo1 - limbo
        zona2 - zona
        limbo2 - limbo

        cocinero1 - cocinero

        cocinero2 - cocinero

        tabla1 - tabla-corte

        tostadora1 - tostadora

        fregadero - fregadero

        sarten1 - sarten
        fogon1 - fogon
        fogon2 - fogon

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
        armario-lechugas - armario

        tomate1 - tomate
        tomate2 - tomate
        tomate3 - tomate
        armario-tomates - armario

        pan1 - pan
        pan2 - pan
        pan3 - pan
        pan4 - pan
        pan5 - pan
        pan6 - pan
        pan7 - pan
        pan8 - pan
        armario-panes - armario

        carne1 - carne
        carne2 - carne
        carne3 - carne
        carne4 - carne
        carne5 - carne
        carne6 - carne
        carne7 - carne
        carne8 - carne
        armario-carnes - armario

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
        (= (ingredientes plato1) 0)
        (= (ingredientes plato2) 0)

        (puede-acceder cocinero1 zona1)
        (pertenece limbo1 zona1)
        (en cocinero1 limbo1)
        (libre cocinero1)

        (puede-acceder cocinero2 zona2)
        (pertenece limbo2 zona2)
        (en cocinero2 limbo2)
        (libre cocinero2)

        (pertenece tabla1 zona1)
        (pertenece tostadora1 zona1)
        (pertenece fregadero zona1)
        (pertenece fogon1 zona1)
        (pertenece fogon2 zona1)
        (pertenece pila zona1)
        (pertenece entregador zona1)
        (pertenece encimera1 zona1)
        (pertenece encimera2 zona1)
        (pertenece encimera3 zona1)
        (pertenece encimera4 zona1)
        (pertenece armario-lechugas zona1)
        (pertenece armario-tomates zona1)
        (pertenece armario-panes zona1)
        (pertenece armario-carnes zona1)
        (pertenece armario-platos zona1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-lechugas)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-panes)
        (prohibido-dejar armario-carnes)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

        (sobre sarten1 encimera1)
        (ocupada encimera1)

        (sobre lechuga1 armario-lechugas)
        (sobre lechuga2 armario-lechugas)
        (sobre lechuga3 armario-lechugas)
        (sobre lechuga4 armario-lechugas)
        (sobre lechuga5 armario-lechugas)

        (sobre tomate1 armario-tomates)
        (sobre tomate2 armario-tomates)
        (sobre tomate3 armario-tomates)

        (sobre pan1 armario-panes)
        (sobre pan2 armario-panes)
        (sobre pan3 armario-panes)
        (sobre pan4 armario-panes)
        (sobre pan5 armario-panes)
        (sobre pan6 armario-panes)
        (sobre pan7 armario-panes)
        (sobre pan8 armario-panes)

        (sobre carne1 armario-carnes)
        (sobre carne2 armario-carnes)
        (sobre carne3 armario-carnes)
        (sobre carne3 armario-carnes)
        (sobre carne4 armario-carnes)
        (sobre carne6 armario-carnes)
        (sobre carne7 armario-carnes)
        (sobre carne8 armario-carnes)

        (sobre plato1 armario-platos)
        (sobre plato2 armario-platos)

        
    )
    (:goal (and
            ; (hamburguesa-simple plato1)
            (hamburguesa-lechuga plato1)
            ; (hamburguesa plato1)
        )
    )
)