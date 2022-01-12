(define (problem p20-burrito)
    (:domain overcooked-burrito)
    (:objects
        zona-1 - zona
        limbo-1 - limbo
        zona-2 - zona
        limbo-2 - limbo
        zona-intercambio - zona
        limbo-intercambio - limbo

        cocinero-1 - cocinero
        cocinero-2 - cocinero

        tabla-1 - tabla-corte
        tabla-2 - tabla-corte

        sarten-1 - sarten
        sarten-2 - sarten

        olla-1 - olla
        olla-2 - olla

        fogon-1 - fogon
        fogon-2 - fogon
        fogon-3 - fogon
        fogon-4 - fogon

        fregadero - fregadero

        pila-1 - pila
        entregador-1 - entregador

        pila-2 - pila
        entregador-2 - entregador

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

        encimera-zona-intercambio-1 - encimera
        encimera-zona-intercambio-2 - encimera
        encimera-zona-intercambio-3 - encimera

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
        plato-3 - plato
        plato-4 - plato
    )
    (:init
        (conectadas zona-1 zona-intercambio)
        (conectadas zona-intercambio zona-1)

        (conectadas zona-2 zona-intercambio)
        (conectadas zona-intercambio zona-2)

        (esta cocinero-1 zona-1)
        (pertenece limbo-1 zona-1)
        (en cocinero-1 limbo-1)
        (libre cocinero-1)

        (esta cocinero-2 zona-2)
        (pertenece limbo-2 zona-2)
        (en cocinero-2 limbo-2)
        (libre cocinero-2)

        (pertenece limbo-intercambio zona-intercambio)

        (pertenece tabla-1 zona-1)

        (pertenece tabla-2 zona-2)

        (pertenece fogon-1 zona-1)
        (pertenece fogon-2 zona-1)

        (pertenece fogon-3 zona-2)
        (pertenece fogon-4 zona-2)

        (pertenece fregadero zona-intercambio)

        (pertenece pila-1 zona-1)
        (pertenece entregador-1 zona-1)

        (pertenece pila-2 zona-2)
        (pertenece entregador-2 zona-2)

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

        (pertenece encimera-zona-intercambio-1 zona-intercambio)
        (pertenece encimera-zona-intercambio-2 zona-intercambio)
        (pertenece encimera-zona-intercambio-3 zona-intercambio)

        (pertenece armario-tortitas zona-intercambio)
        (pertenece armario-arroces zona-intercambio)
        (pertenece armario-carnes zona-intercambio)
        (pertenece armario-pollos zona-intercambio)

        (prohibido-dejar pila-1)
        (prohibido-dejar pila-2)
        (prohibido-dejar armario-tortitas)
        (prohibido-dejar armario-arroces)
        (prohibido-dejar armario-carnes)
        (prohibido-dejar armario-pollos)
        (prohibido-dejar entregador-1)
        (prohibido-dejar entregador-2)

        (sobre sarten-1 fogon-1)
        (vacio sarten-1)
        (ocupada fogon-1)

        (sobre olla-1 fogon-2)
        (vacio olla-1)
        (ocupada fogon-2)

        (sobre sarten-2 fogon-3)
        (vacio sarten-2)
        (ocupada fogon-3)

        (sobre olla-2 fogon-4)
        (vacio olla-2)
        (ocupada fogon-4)

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

        (sobre plato-1 encimera-zona1-4)
        (ocupada encimera-zona1-4)
        (vacio plato-1)
        (sobre plato-2 encimera-zona1-6)
        (ocupada encimera-zona1-5)
        (vacio plato-2)

        (sobre plato-3 encimera-zona2-4)
        (ocupada encimera-zona2-4)
        (vacio plato-3)
        (sobre plato-4 encimera-zona2-5)
        (ocupada encimera-zona2-5)
        (vacio plato-4)
    )
    (:goal (and
            ; (burrito-pollo plato-1)
            ; (burrito-carne plato-1)
            (burrito-carne plato-2)
        )
    )
)