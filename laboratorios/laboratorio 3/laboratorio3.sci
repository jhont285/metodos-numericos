//////////////////////////////////////////////////////////////////////////
// Función que permita realizar la interpolación mediante el método de  //
// interpolación de Lagrange.                                           //
//////////////////////////////////////////////////////////////////////////
// * X: Vector de las abscisas de los nodos.                            //
// * Y: Vector de las ordenadas de los nodos.                           //
// * x: Valor a interpolar o extrapolar.                                //
//////////////////////////////////////////////////////////////////////////
// * fx: evaluacion en el punto x.                                      //
//////////////////////////////////////////////////////////////////////////

function fx = UN_Inter_Lagrange(X,Y,x)
    N = length( X )
    fx = 0
    for i = 1 : N
        mul = Y(i)
        for j = 1: N
            if i ~= j then
                mul = mul * ( ( x - X(j) ) / ( X(i) - X(j) ) )
            end
        end
        fx = fx + mul
    end
endfunction

//////////////////////////////////////////////////////////////////////////
// Función que permita realizar la interpolación mediante el método de  //
// interpolación de Newton.                                             //
//////////////////////////////////////////////////////////////////////////
// * X: Vector de las abscisas de los nodos.                            //
// * Y: Vector de las ordenadas de los nodos.                           //
// * x: Valor a interpolar o extrapolar.                                //
//////////////////////////////////////////////////////////////////////////
// * fx: evaluacion en el punto x.                                      //
//////////////////////////////////////////////////////////////////////////

function fx = UN_Inter_Newton(X,Y,x)
    N = length( X )
    for i = 2: N  
        aux = ( Y(i) - Y(i - 1) ) / ( X(i) - X(1) )
        for j = i + 1: N
            aux2 = ( Y(j) - Y(j - 1) )/ ( X(j) - X(j-i+1) )
            Y(j-1) = aux
            aux = aux2
        end
        Y(N) = aux
    end
    fx = 0
    for i = 1: N // evaluamos el polinomio en el punto
        mul = 1.0
        for j = i - 1: -1: 1
            mul = mul*( x - X(j) )
        end
        fx = fx  + Y(i) * mul
    end
endfunction

