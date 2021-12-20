(define (problem hamburguesa)
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

        pan1 - pan
        pan2 - pan
        pan3 - pan
        pan4 - pan
        pan5 - pan
        pan6 - pan
        armario-panes - armario

        carne1 - carne
        carne2 - carne
        carne3 - carne
        carne4 - carne
        carne5 - carne
        carne6 - carne
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

        (en cocinero fregadero)
        (libre cocinero)

        (sobre sarten1 encimera1)
        (ocupada encimera1)

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

        (sobre pan1 armario-panes)
        (sobre pan2 armario-panes)
        (sobre pan3 armario-panes)
        (sobre pan4 armario-panes)
        (sobre pan5 armario-panes)
        (sobre pan6 armario-panes)

        (sobre carne1 armario-carnes)
        (sobre carne2 armario-carnes)
        (sobre carne3 armario-carnes)
        (sobre carne3 armario-carnes)
        (sobre carne4 armario-carnes)
        (sobre carne6 armario-carnes)

        (sobre plato1 armario-platos)
        (sobre plato2 armario-platos)

        (prohibido-usar pila)
        (prohibido-usar fregadero)

        (prohibido-dejar pila)
        (prohibido-dejar armario-lechugas)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-panes)
        (prohibido-dejar armario-carnes)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

        (prohibido-coger entregador)
    )
    (:goal
        (hamburguesa-simple plato1)
    )
)