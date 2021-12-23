(define (problem sopa)
    (:domain overcooked)
    (:objects
        zona1 - zona

        limbo1 - localizacion

        cocinero1 - cocinero

        tabla1 - tabla-corte

        fregadero - fregadero

        inusable - sarten

        multiolla1 - multiolla
        fogon1 - fogon
        fogon2 - fogon

        pila - pila
        entregador - entregador

        encimera1 - encimera
        encimera2 - encimera
        encimera3 - encimera
        encimera4 - encimera

        tomate1 - tomate
        tomate2 - tomate
        tomate3 - tomate
        tomate4 - tomate
        tomate5 - tomate
        tomate6 - tomate
        armario-tomates - armario

        cebolla1 - cebolla
        cebolla2 - cebolla
        cebolla3 - cebolla
        cebolla4 - cebolla
        cebolla5 - cebolla
        cebolla6 - cebolla
        armario-cebollas - armario

        champinion1 - champinion
        champinion2 - champinion
        champinion3 - champinion
        champinion4 - champinion
        champinion5 - champinion
        champinion6 - champinion
        armario-champiniones - armario

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

        (pertenece tabla1 zona1)
        (pertenece fregadero zona1)
        (pertenece fogon1 zona1)
        (pertenece fogon2 zona1)
        (pertenece pila zona1)
        (pertenece entregador zona1)
        (pertenece encimera1 zona1)
        (pertenece encimera2 zona1)
        (pertenece encimera3 zona1)
        (pertenece encimera4 zona1)
        (pertenece armario-tomates zona1)
        (pertenece armario-cebollas zona1)
        (pertenece armario-champiniones zona1)
        (pertenece armario-platos zona1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-tomates)
        (prohibido-dejar armario-cebollas)
        (prohibido-dejar armario-champiniones)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

        (sobre multiolla1 encimera1)
        (ocupada encimera1)

        (sobre tomate1 armario-tomates)
        (sobre tomate2 armario-tomates)
        (sobre tomate3 armario-tomates)
        (sobre tomate4 armario-tomates)
        (sobre tomate5 armario-tomates)
        (sobre tomate6 armario-tomates)

        (sobre cebolla1 armario-cebollas)
        (sobre cebolla2 armario-cebollas)
        (sobre cebolla3 armario-cebollas)
        (sobre cebolla4 armario-cebollas)
        (sobre cebolla5 armario-cebollas)
        (sobre cebolla6 armario-cebollas)

        (sobre champinion1 armario-champiniones)
        (sobre champinion2 armario-champiniones)
        (sobre champinion3 armario-champiniones)
        (sobre champinion4 armario-champiniones)
        (sobre champinion5 armario-champiniones)
        (sobre champinion6 armario-champiniones)

        (sobre plato1 armario-platos)
        (sobre plato2 armario-platos)
    )
    (:goal (and
            (sopa-tomate plato1)
        )
    )
)