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
    R = zeros( N, N )
    R(:,1) = Y';
    dif = 1
    for i = 2: N // creamos la matriz de diferencias divididas
        for j = i: N
            R(j,i) = ( R(j,i - 1) - R(j - 1,i - 1) )/ ( X(j) - X(j-dif) )
        end
        dif = dif + 1
    end
    fx = 0
    for i = 1: N // evaluamos el polinomio en el punto
        aux = R(i,i)
        mul = 1.0
        for j = i - 1: -1: 1
            mul = mul*( x - X(j) )
        end
        fx = fx  + aux * mul
    end
endfunction
