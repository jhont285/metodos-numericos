clc

printf("\n\t\t ====  Método de bisección  ====\n\n")

UN_biseccion([1 2 10 -20], -2, 2, 1e-8, 5);

printf("\n\n")

UN_biseccion([1 2 10 -20], -2, 2, 1e-8, 1e6);

printf("\n\n\n\t\t ====  Método de la regla falsa  ====\n\n")

UN_regla_falsa([1 2 10 -20], -2, 2, 1e-8, 5);

printf("\n\n")

UN_regla_falsa([1 2 10 -20], -2, 2, 1e-8, 1e6);

printf("\n\n\n\t\t ====  Método de Newton  ====\n\n")

UN_newton([1 2 10 -20], -2, 1e-8, 5);

printf("\n\n")

UN_newton([1 2 10 -20], -2, 1e-8, 1e6);


printf("\n\n\n\t\t ====  Método de la secante  ====\n\n")

UN_secante([1 2 10 -20], -2, 2, 1e-8, 5);

printf("\n\n")

UN_secante([1 2 10 -20], -2, 2, 1e-8, 1e6);

