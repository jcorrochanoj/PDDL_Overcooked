(define (problem burrito)
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
        
        sarten1 - sarten
        olla1 - olla
        fogon1 - fogon
        fogon2 - fogon

        inusable1 - multiolla

        pila - pila
        entregador - entregador

        encimera1 - encimera
        encimera2 - encimera
        encimera3 - encimera
        encimera4 - encimera

        tortita1 - tortita
        tortita2 - tortita
        tortita3 - tortita
        tortita4 - tortita
        tortita5 - tortita
        tortita6 - tortita
        armario-tortitas - armario

        arroz1 - arroz
        arroz2 - arroz
        arroz3 - arroz
        arroz4 - arroz
        arroz5 - arroz
        arroz6 - arroz
        armario-arroces - armario

        pollo1 - pollo
        pollo2 - pollo
        pollo3 - pollo
        armario-pollos - armario

        carne1 - carne
        carne2 - carne
        carne3 - carne
        armario-carnes - armario

        plato1 - plato
        plato2 - plato
        armario-platos - armario
    )
    (:init
        (esta cocinero1 zona1)
        (pertenece limbo1 zona1)
        (en cocinero1 limbo1)
        (libre cocinero1)

        (esta cocinero2 zona2)
        (pertenece limbo2 zona2)
        (en cocinero2 limbo2)
        (libre cocinero2)

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
        (pertenece armario-tortitas zona1)
        (pertenece armario-arroces zona1)
        (pertenece armario-pollos zona1)
        (pertenece armario-carnes zona1)
        (pertenece armario-platos zona1)

        (prohibido-dejar pila)
        (prohibido-dejar armario-tortitas)
        (prohibido-dejar armario-arroces)
        (prohibido-dejar armario-pollos)
        (prohibido-dejar armario-carnes)
        (prohibido-dejar entregador)

        (sobre sarten1 encimera1)
        (vacio sarten1)
        (ocupada encimera1)

        (sobre olla1 encimera2)
        (vacio olla1)
        (ocupada encimera2)

        (sobre tortita1 armario-tortitas)
        (sobre tortita2 armario-tortitas)
        (sobre tortita3 armario-tortitas)
        (sobre tortita4 armario-tortitas)
        (sobre tortita5 armario-tortitas)
        (sobre tortita6 armario-tortitas)

        (sobre arroz1 armario-arroces)
        (sobre arroz2 armario-arroces)
        (sobre arroz3 armario-arroces)
        (sobre arroz4 armario-arroces)
        (sobre arroz5 armario-arroces)
        (sobre arroz6 armario-arroces)

        (sobre pollo1 armario-pollos)
        (sobre pollo2 armario-pollos)
        (sobre pollo3 armario-pollos)

        (sobre carne1 armario-carnes)
        (sobre carne2 armario-carnes)
        (sobre carne3 armario-carnes)

        (sobre plato1 armario-platos)
        (vacio plato1)
        (sobre plato2 armario-platos)
        (vacio plato2)
    )
    (:goal (and
            (burrito-pollo plato1)
            (burrito-carne plato1)
            ; (burrito-carne plato2)
        )
    )
)