(define (problem fish-and-chips)
    (:domain overcooked)
    (:objects
        zona1 - zona
        limbo1 - limbo
        zona2 - zona
        limbo2 - limbo

        cocinero1 - cocinero

        cocinero2 - cocinero

        tabla1 - tabla-corte

        fregadero - fregadero

        cesta1 - cesta
        freidora1 - freidora
        freidora2 - freidora

        inusable1 - multiolla

        pila - pila
        entregador - entregador

        encimera1 - encimera
        encimera2 - encimera
        encimera3 - encimera
        encimera4 - encimera

        pescado1 - pescado
        pescado2 - pescado
        pescado3 - pescado
        pescado4 - pescado
        pescado5 - pescado
        armario-pescados - armario

        patata1 - patata
        patata2 - patata
        patata3 - patata
        patata4 - patata
        patata5 - patata
        armario-patatas - armario

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

        (puede-acceder cocinero2 zona2)
        (pertenece limbo2 zona2)
        (en cocinero2 limbo2)
        (libre cocinero2)

        (pertenece tabla1 zona1)
        (pertenece fregadero zona1)
        (pertenece freidora1 zona1)
        (pertenece freidora2 zona1)
        (pertenece pila zona1)
        (pertenece entregador zona1)
        (pertenece encimera1 zona1)
        (pertenece encimera2 zona1)
        (pertenece encimera3 zona1)
        (pertenece encimera4 zona1)
        (pertenece armario-pescados zona1)
        (pertenece armario-patatas zona1)
        (pertenece armario-platos zona1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-pescados)
        (prohibido-dejar armario-patatas)
        (prohibido-dejar armario-platos)
        (prohibido-dejar entregador)

        (sobre cesta1 encimera1)
        (ocupada encimera1)

        (sobre pescado1 armario-pescados)
        (sobre pescado2 armario-pescados)
        (sobre pescado3 armario-pescados)
        (sobre pescado4 armario-pescados)
        (sobre pescado5 armario-pescados)

        (sobre patata1 armario-patatas)
        (sobre patata2 armario-patatas)
        (sobre patata3 armario-patatas)
        (sobre patata4 armario-patatas)
        (sobre patata5 armario-patatas)

        (sobre plato1 armario-platos)
        (sobre plato2 armario-platos)
    )
    (:goal (and
            ; (patatas-fritas plato1)
            ; (pescado-frito plato1)
            (fish-and-chips plato1)
        )
    )
)