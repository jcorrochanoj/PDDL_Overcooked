; Overcooked v1

(define (problem overcooked-ensalada-test)
    (:domain overcooked_v1)
    (:objects
        cocinero - cocinero

        tabla-1 - tabla-corte

        fregadero - fregadero

        pila - pila

        entregador - entregador

        encimera-1 - encimera
        encimera-2 - encimera
        encimera-3 - encimera
        encimera-4 - encimera

        lechuga-1 - lechuga
        lechuga-2 - lechuga
        lechuga-3 - lechuga
        lechuga-4 - lechuga
        lechuga-5 - lechuga
        lechuga-6 - lechuga
        armario-lechugas - armario

        tomate-1 - tomate
        tomate-2 - tomate
        tomate-3 - tomate
        tomate-4 - tomate
        tomate-5 - tomate
        tomate-6 - tomate
        armario-tomates - armario

        pepino-1 - pepino
        pepino-2 - pepino
        pepino-3 - pepino
        pepino-4 - pepino
        pepino-5 - pepino
        pepino-6 - pepino
        armario-pepinos - armario

        plato-1 - plato
        plato-2 - plato
        armario-platos - armario
    )
    (:init
        (en cocinero fregadero)
        (libre cocinero)

        ; (forall (?lechuga - lechuga) 
        ;     (sobre ?lechuga armario-lechugas)
        ; )
        (sobre lechuga-1 armario-lechugas)
        (sobre lechuga-2 armario-lechugas)
        (sobre lechuga-3 armario-lechugas)
        (sobre lechuga-4 armario-lechugas)
        (sobre lechuga-5 armario-lechugas)
        (sobre lechuga-6 armario-lechugas)

        (sobre tomate-1 armario-tomates)
        (sobre tomate-2 armario-tomates)
        (sobre tomate-3 armario-tomates)
        (sobre tomate-4 armario-tomates)
        (sobre tomate-5 armario-tomates)
        (sobre tomate-6 armario-tomates)

        (sobre pepino-1 armario-pepinos)
        (sobre pepino-2 armario-pepinos)
        (sobre pepino-3 armario-pepinos)
        (sobre pepino-4 armario-pepinos)
        (sobre pepino-5 armario-pepinos)
        (sobre pepino-6 armario-pepinos)

        (sobre plato-1 armario-platos)
        (sobre plato-2 armario-platos)

        (= (eleboraciones plato-1) 3)

        (disponible tabla-1)
        (disponible fregadero)

        (disponible encimera-1)
        (disponible encimera-2)
        (disponible encimera-3)
        (disponible encimera-4)
    )
    (:goal
        (and
            (ensalada-completa-echa)
        )
    )
)