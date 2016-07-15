//////////////////////////////////////////////////////////////
// Función que permite obtener la aproximacion de la        //
// integral de una función f desde un punto a hasta un      //
// punto b, utilizando la regla del trapecio.               //
//////////////////////////////////////////////////////////////
// * a es el límite inferior de la integral                 //
// * b es el límite superior de la integral                 //
// * n es el número de particiones del intervalo [a, b].    //
//////////////////////////////////////////////////////////////
// * T es la aproximación al resultado de la integral       //
//////////////////////////////////////////////////////////////  

function T = UN_integral_trapecio(a,b,n)
    T = (f(a) + f(b)) / 2
    h = (b - a) / n
    for k = 1: n - 1
        T = T + f( k*h + a )
    end
    T = T * h
endfunction

//////////////////////////////////////////////////////////////
// Función que permite obtener la aproximacion de la        //
// integral de una función f desde un punto a hasta un      //
// punto b, utilizando la regla de 1/3 de Simpson.          //
//////////////////////////////////////////////////////////////
// * a es el límite inferior de la integral                 //
// * b es el límite superior de la integral                 //
// * n es el número de particiones del intervalo [a, b].    //
//////////////////////////////////////////////////////////////
// * S es la aproximación al resultado de la integral       //
//////////////////////////////////////////////////////////////

function S = UN_integral_simpson(a,b,n)
    S =  (f(a) + f(b))
    h = (b - a) / ( 2 * n )
    aux = 0
    for k = 1: n - 1
        aux = aux + f( 2*k*h + a )
    end
    S = S + aux * 2
    aux = 0
    for k = 1: n
        aux = aux + f( (2*k - 1) * h + a )
    end
    S = (S + aux * 4) * ( h / 3 )
endfunction
