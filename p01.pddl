; Overcooked v1

(define (problem overcooked-ensalada-test)
    (:domain overcooked_v1)
    (:objects
        cocinero - cocinero

        tabla-1 - tabla-corte

        fregadero-1 - fregadero

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
        (en cocinero fregadero-1)
        (libre cocinero)

        ; (forall (?lechuga - lechuga) 
        ;     (en ?lechuga armario-lechugas)
        ; )
        (en lechuga-1 armario-lechugas)
        (en lechuga-2 armario-lechugas)
        (en lechuga-3 armario-lechugas)
        (en lechuga-4 armario-lechugas)
        (en lechuga-5 armario-lechugas)
        (en lechuga-6 armario-lechugas)

        (en tomate-1 armario-tomates)
        (en tomate-2 armario-tomates)
        (en tomate-3 armario-tomates)
        (en tomate-4 armario-tomates)
        (en tomate-5 armario-tomates)
        (en tomate-6 armario-tomates)

        (en pepino-1 armario-pepinos)
        (en pepino-2 armario-pepinos)
        (en pepino-3 armario-pepinos)
        (en pepino-4 armario-pepinos)
        (en pepino-5 armario-pepinos)
        (en pepino-6 armario-pepinos)

        (en plato-1 armario-platos)
        (en plato-2 armario-platos)

        (libre tabla-1)
        (libre fregadero-1)

        (libre encimera-1)
        (libre encimera-2)
        (libre encimera-3)
        (libre encimera-4)
    )
    (:goal
        (and
            (cortado lechuga-1)
            (cortado tomate-1)
            (cortado pepino-1)
            (emplatado lechuga-1 plato-1)
            (emplatado tomate-1 plato-1)
            (emplatado pepino-1 plato-1)

            (entregado plato-1)
        )
    )
)