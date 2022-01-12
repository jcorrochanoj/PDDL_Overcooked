(define (problem p12-fish-and-chips)
    (:domain overcooked-fish-and-chips)
    (:objects
        zona-1 - zona
        limbo-1 - limbo

        cocinero-1 - cocinero
        cocinero-2 - cocinero

        tabla-1 - tabla-corte
        tabla-2 - tabla-corte

        cesta-1 - cesta
        cesta-2 - cesta
        cesta-3 - cesta
        cesta-4 - cesta

        freidora-1 - freidora
        freidora-2 - freidora
        freidora-3 - freidora
        freidora-4 - freidora

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

        pescado-1 - pescado
        pescado-2 - pescado
        pescado-3 - pescado
        pescado-4 - pescado
        pescado-5 - pescado
        armario-pescados - armario

        patata-1 - patata
        patata-2 - patata
        patata-3 - patata
        patata-4 - patata
        patata-5 - patata
        armario-patatas - armario

        plato-1 - plato
        plato-2 - plato
        plato-3 - plato
    )
    (:init
        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (esta cocinero-2 zona-1)
        (en cocinero-2 limbo-1)
        (libre cocinero-2)

        (pertenece tabla-1 zona-1)
        (pertenece tabla-2 zona-1)

        (pertenece freidora-1 zona-1)
        (pertenece freidora-2 zona-1)
        (pertenece freidora-3 zona-1)
        (pertenece freidora-4 zona-1)

        (pertenece fregadero zona-1)

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

        (pertenece armario-pescados zona-1)
        (pertenece armario-patatas zona-1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-pescados)
        (prohibido-dejar armario-patatas)
        (prohibido-dejar entregador)

        (sobre cesta-1 freidora-1)
        (vacio cesta-1)
        (ocupada freidora-1)
        (sobre cesta-2 freidora-2)
        (vacio cesta-2)
        (ocupada freidora-2)
        (sobre cesta-3 freidora-3)
        (vacio cesta-3)
        (ocupada freidora-3)
        (sobre cesta-4 freidora-4)
        (vacio cesta-4)
        (ocupada freidora-4)

        (sobre pescado-1 armario-pescados)
        (sobre pescado-2 armario-pescados)
        (sobre pescado-3 armario-pescados)
        (sobre pescado-4 armario-pescados)
        (sobre pescado-5 armario-pescados)

        (sobre patata-1 armario-patatas)
        (sobre patata-2 armario-patatas)
        (sobre patata-3 armario-patatas)
        (sobre patata-4 armario-patatas)
        (sobre patata-5 armario-patatas)

        (sobre plato-1 encimera-zona1-6)
        (ocupada encimera-zona1-6)
        (= (ingredientes plato-1) 0)
        (vacio plato-1)
        (sobre plato-2 encimera-zona1-7)
        (ocupada encimera-zona1-7)
        (= (ingredientes plato-2) 0)
        (vacio plato-2)
        (sobre plato-3 encimera-zona1-8)
        (ocupada encimera-zona1-8)
        (= (ingredientes plato-3) 0)
        (vacio plato-3)
    )
    (:goal (and
            (patatas-fritas plato-1)
            ; (pescado-frito plato-2)
            (fish-and-chips plato-3)
        )
    )
)
