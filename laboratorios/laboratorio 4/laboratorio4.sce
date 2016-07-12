clc

disp("* Ajuste lineal")

X = -1:1:6
Y = [10 9 7 5 4 3 0 -1]

disp(X)
disp(Y)

[A,B] = UN_ajuste_lineal(X,Y)

disp(" >> resultado:")
disp([A,B])

disp("* Ajuste potencial")

X = 0.2:0.2:1
Y = [0.1960 0.7850 1.7665 3.1405 4.9075]

disp(X)
disp(Y)

A = UN_ajuste_potencial(X,Y,2)

disp(" >> resultado:")
disp(A)

disp("* Ajuste exponencial")

X = 0:4
Y = [1.5 2.5 3.5 5.0 7.5]

disp(X)
disp(Y)

[A,C] = UN_ajuste_exponencial(X,Y)

disp(" >> resultado:")
disp([A,C])

disp("* Ajuste parabólico")

X = 2:9
Y = [18 24 35 44 59 72 91 109]

disp(X)
disp(Y)

[A,B,C] = UN_ajuste_parabolico(X,Y)

disp(" >> resultado:")
disp([A,B,C])
