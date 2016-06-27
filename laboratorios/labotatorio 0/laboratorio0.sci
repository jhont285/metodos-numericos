/////////////////////////////////////////////////////////////
// Esta funcion calcula el epsilon de la maquina            //
//////////////////////////////////////////////////////////////
// Dado que el epsilon de la maquina es el numero           //
// decimal mas pequeño que sumado con 1 se calcula de manera//
// precisa, colocamos esa condicion en el ciclo while       //
// y vamos dividiendo una variable auxiliar (xk) en dos     //
// hasta calcular el epsilon de la maquina                  //
//////////////////////////////////////////////////////////////

function UN_epsilon()
    xk = 1
    i = 0
    printf( '-----------------------------------\n' )
    printf( 'i\t\t epsilon                    \n')
    printf( '-----------------------------------\n' )
    while xk + 1 > 1
        printf( '%d\t%.20e\n', i, xk )
        xk = xk / 2        
        i = i + 1
    end
    printf( '-----------------------------------' )
endfunction

//////////////////////////////////////////////////////
// Esta funcion calcula la raiz cuadrada de un num  //
//////////////////////////////////////////////////////
// Para esto es necesario tener  x0 = valor         //
// eps = epsilon, M = max cantidad iteracion.       //
// Hacemos el calculo con la siguiente ecuacion     //
// x_k = valor inicial                              //
// x_(k+1) = ( x_k + a / x_k ) / 2                  //
//////////////////////////////////////////////////////

function r = UN_raiz_cuadrada( a, x0, eps, M )
    printf(  "---------------------------------------------------------\n" )
    printf(  " i \t\t Xi \t\t\t error\n" )
    printf(  "---------------------------------------------------------\n" )
    i = 0
    xk = x0
    x0 = a
    while i <= M & eps <= abs( (xk-x0)/xk )
        if i == 0
            printf( " %d\t %.15f\t-------------------------\n", i, xk ) 
        else
           x0 = xk
           xk = ( xk + a / xk )/2              
           printf( " %d\t %.15f\t%.15f\n", i, xk, abs( (xk-x0)/xk ) )
        end
        i = i + 1
    end
    r = xk
    printf(  "---------------------------------------------------------\n" )
    if i == M+1
        printf( "FRACASO el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "EXITO el cálculo no fue exitoso, la mejor aproximación\n" )
    end
    printf( "de la raíz cuadrada de 2 es:\t %.20f\n", r )
    printf(  "---------------------------------------------------------\n" )

endfunction

//////////////////////////////////////////////////////
// Esta funcion evalua un valor x en un polinomio A //
//////////////////////////////////////////////////////
// Para esto utilizamos el metodo de horner que es  //
//  b_n = a_n --> paso inicial                      //
//  b_k = a_k + x * b_(k+1)                         //
//////////////////////////////////////////////////////

function px = UN_horner(A, x)
    px = A(1)
    for i = 2 : length(A)
        px = A(i) + x*px
    end
endfunction

////////////////////////////////////////////////////////
// Esta funcion calcula la derivada de un polinomio   //
////////////////////////////////////////////////////////
// Para esto utilizamos la siguiente ecuacion         //
// dx/dy( x^n ) = n * x^(n-1)                         //
////////////////////////////////////////////////////////

function dp = UN_derivada_poli(A)
    dp = zeros( 1, length(A)-1 )
    n = length(dp)
    for i = 1 : length(dp)
        dp(i) = A(i)*n
        n = n - 1
    end
endfunction

//////////////////////////////////////////////////////////
// Esta funcion calcula f(x) = e^x                      //
//////////////////////////////////////////////////////////
// Hacemos el calculo por medio de las series de taylor //
// de lo que tenenemos. e^x = sum_{k=0}^{x} x^k / k!    //
// Por otro lado limitamos la cantidad de iteraciones   //
// M y con el eps                                       //
//////////////////////////////////////////////////////////

function ex = UN_exp(x,eps,M)
    printf(  "---------------------------------------------------------\n" )
    printf(  " i \t\t Xi \t\t\t error\n" )
    printf(  "---------------------------------------------------------\n" )
    i = 0
    xb = x
    xa = 1
    while i < M & eps <= abs( (xb - xa) / xb )
        if i == 0
            printf( "%d\t %.15f\t-------------------------\n", i, xa ) 
        else
            xb = xa
            xa = xb + ( (x)^i )/factorial(i)
            printf( "%d\t %.15f\t %.15f\n", i, xa, abs( (xb - xa) / xb ) )
        end
        i = i + 1
    end
    ex = xa
    printf(  "---------------------------------------------------------\n" )
    if i == M
        printf( "FRACASO el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "EXITO el cálculo no fue exitoso, la mejor aproximación\n" )
    end
    printf( "de la exponencial de %.5f es: %.20f\n", x, ex )
    printf(  "---------------------------------------------------------\n" )
endfunction

