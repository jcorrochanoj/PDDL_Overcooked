(define (problem p20-burrito)
    (:domain overcooked-burrito)
    (:objects
        zona-1 - zona
        limbo-1 - limbo
        zona-2 - zona
        limbo-2 - limbo
        zona-3 - zona
        limbo-3 - limbo
        zona-4 - zona
        limbo-4 - limbo

        cocinero-1 - cocinero
        cocinero-2 - cocinero

        tabla-1 - tabla-corte

        sarten-1 - sarten
        sarten-2 - sarten

        olla-1 - olla

        fogon-1 - fogon
        fogon-2 - fogon
        fogon-3 - fogon

        fregadero - fregadero

        pila - pila
        entregador - entregador

        encimera-zona1-1 - encimera
        encimera-zona1-2 - encimera

        encimera-zona2-1 - encimera
        encimera-zona2-2 - encimera
        encimera-zona2-3 - encimera
        encimera-zona2-4 - encimera

        tortita-1 - tortita
        tortita-2 - tortita
        tortita-3 - tortita
        tortita-4 - tortita
        tortita-5 - tortita
        tortita-6 - tortita
        tortita-7 - tortita
        tortita-8 - tortita
        armario-tortitas - armario

        arroz-1 - arroz
        arroz-2 - arroz
        arroz-3 - arroz
        arroz-4 - arroz
        arroz-5 - arroz
        arroz-6 - arroz
        arroz-7 - arroz
        arroz-8 - arroz
        armario-arroces - armario

        carne-1 - carne
        carne-2 - carne
        carne-3 - carne
        carne-4 - carne
        armario-carnes - armario

        pollo-1 - pollo
        pollo-2 - pollo
        pollo-3 - pollo
        pollo-4 - pollo
        armario-pollos - armario

        plato-1 - plato
        plato-2 - plato
    )
    (:init
        (conectadas zona-1 zona-2)
        (conectadas zona-2 zona-1)

        (conectadas zona-1 zona-3)
        (conectadas zona-3 zona-2)

        (conectadas zona-3 zona-4)
        (conectadas zona-4 zona-3)

        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (esta cocinero-2 zona-3)
        (pertenece limbo-3 zona-3)
        (en cocinero-2 limbo-3)
        (libre cocinero-2)

        (pertenece limbo-2 zona-2)
        (pertenece limbo-4 zona-4)

        (pertenece tabla-1 zona-1)

        (pertenece fogon-1 zona-1)

        (pertenece fogon-2 zona-2)
        (pertenece fogon-3 zona-2)

        (pertenece fregadero zona-3)

        (pertenece pila zona-4)
        (pertenece entregador zona-4)

        (pertenece encimera-zona1-1 zona-1)
        (pertenece encimera-zona1-2 zona-1)

        (pertenece encimera-zona2-1 zona-2)
        (pertenece encimera-zona2-2 zona-2)
        (pertenece encimera-zona2-3 zona-2)
        (pertenece encimera-zona2-4 zona-2)

        (pertenece armario-tortitas zona-3)
        (pertenece armario-arroces zona-3)
        (pertenece armario-carnes zona-3)
        (pertenece armario-pollos zona-3)

        (prohibido-dejar pila)
        (prohibido-dejar armario-tortitas)
        (prohibido-dejar armario-arroces)
        (prohibido-dejar armario-carnes)
        (prohibido-dejar armario-pollos)
        (prohibido-dejar entregador)

        (sobre olla-1 fogon-1)
        (vacio olla-1)
        (ocupada fogon-1)

        (sobre sarten-1 fogon-2)
        (vacio sarten-1)
        (ocupada fogon-2)

        (sobre sarten-2 fogon-3)
        (vacio sarten-2)
        (ocupada fogon-3)

        (sobre tortita-1 armario-tortitas)
        (sobre tortita-2 armario-tortitas)
        (sobre tortita-3 armario-tortitas)
        (sobre tortita-4 armario-tortitas)
        (sobre tortita-5 armario-tortitas)
        (sobre tortita-6 armario-tortitas)
        (sobre tortita-7 armario-tortitas)
        (sobre tortita-8 armario-tortitas)

        (sobre arroz-1 armario-arroces)
        (sobre arroz-2 armario-arroces)
        (sobre arroz-3 armario-arroces)
        (sobre arroz-4 armario-arroces)
        (sobre arroz-5 armario-arroces)
        (sobre arroz-6 armario-arroces)
        (sobre arroz-7 armario-arroces)
        (sobre arroz-8 armario-arroces)

        (sobre carne-1 armario-carnes)
        (sobre carne-2 armario-carnes)
        (sobre carne-3 armario-carnes)
        (sobre carne-4 armario-carnes)

        (sobre pollo-1 armario-pollos)
        (sobre pollo-2 armario-pollos)
        (sobre pollo-3 armario-pollos)
        (sobre pollo-4 armario-pollos)

        (sobre plato-1 encimera-zona2-3)
        (ocupada encimera-zona2-3)
        (= (ingredientes plato-1) 0)
        (vacio plato-1)
        (sobre plato-2 encimera-zona2-4)
        (ocupada encimera-zona2-4)
        (= (ingredientes plato-2) 0)
        (vacio plato-2)
    )
    (:goal (and
            ; (burrito-pollo plato-1)
            ; (burrito-carne plato-1)
            (burrito-carne plato-2)
        )
    )
)
