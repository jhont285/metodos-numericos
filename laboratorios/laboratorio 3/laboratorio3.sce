clc

// Conjunto de nodos

printf("Conjunto de nodos\n")

X = -5:5

disp(X)

Y = 2.^X

disp(Y)

// Valores a interpolar o extrapolar

printf("\n Valores a interpolar o extrapolar\n")

x1 = 1/2

disp(x1)

x2 = 1/3

disp(x2)

x3 = 1/4

disp(x3)

//Interpolación mediante Lagrange

printf("\n Interpolación mediante Lagrange\n\n")

p1 = UN_Inter_Lagrange(X,Y,x1)

printf("\tp(%f) = %.12f\n",x1,p1)

p2 = UN_Inter_Lagrange(X,Y,x2)

printf("\tp(%f) = %.12f\n",x2,p2)

p3 = UN_Inter_Lagrange(X,Y,x3)

printf("\tp(%f) = %.12f\n",x3,p3)

//Interpolación mediante Newton

printf("\n Interpolación mediante Newton\n\n")

f1 = UN_Inter_Newton(X,Y,x1)

printf("\tp(%f) = %.12f\n",x1,f1)

f2 = UN_Inter_Newton(X,Y,x2)

printf("\tp(%f) = %.12f\n",x2,f2)

f3 = UN_Inter_Newton(X,Y,x3)

printf("\tp(%f) = %.12f\n",x3,f3)
