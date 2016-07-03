clc

printf("\t\t === Minimo de la maquina ===\n\n")

UN_epsilon;

printf("\n")

printf("\t\t === Raiz Cuadrada ===\n\n")

UN_raiz_cuadrada(2,99,1e-10,10);

printf("\n")

UN_raiz_cuadrada(2,99,1e-10,15);

printf("\n")

printf("\t\t === Metodo de horner ===\n\n")

p = UN_horner([3 7 0 -8 4],2);

disp('p = ')
disp(p)

printf("\t\t === Derivada de un polinomio ===\n\n")

dx = UN_derivada_poli([3 7 0 -8 4]);

disp('dx = ')
disp(dx)

printf("\n")

printf("\t\t === Funcion e^x ===\n\n")

UN_exp(0.5,10e-10,10);

printf("\n")

UN_exp(0.5,10e-10,15);

printf("\n")

