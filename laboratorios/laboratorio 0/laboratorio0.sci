//////////////////////////////////////////////////////////////
// Funcion que permite calcular el epsilon de la maquina    //
//////////////////////////////////////////////////////////////
// El epsilon de la maquina es el numero decimal mas        //
// pequeño que sumado con 1 se calcula de manera precisa    //
//////////////////////////////////////////////////////////////

function UN_epsilon()
    printf( '-----------------------------------\n' )
    printf( ' i\t\t epsilon                    \n')
    printf( '-----------------------------------\n' )
    xk = 1
    i = 0
    while xk + 1 > 1
        printf( ' %d\t%.20e\n', i, xk )
        xk = xk / 2        
        i = i + 1
    end
    printf( '-----------------------------------' )
endfunction

//////////////////////////////////////////////////////
// Funcion que permite calcular una aproximacion    //
// de la raiz cuadrada de un numero                 //
//////////////////////////////////////////////////////
// a = valor al cual queremos calcular la raiz      //
// x0 = valor inicial                               //
// eps = epsilon                                    //
// M = maxima cantidad de iteraciones               //
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
           xk = ( xk + a / xk ) / 2              
           printf( " %d\t %.15f\t%.15f\n", i, xk, abs( (xk-x0)/xk ) )
        end
        i = i + 1
    end
    r = xk
    printf(  "---------------------------------------------------------\n" )
    if i == M+1
        printf( "¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "¡EXITO! el cálculo no fue exitoso, la mejor aproximación\n" )
    end
    printf( "de la raíz cuadrada de 2 es:\t %.20f\n", r )
    printf(  "---------------------------------------------------------\n" )

endfunction

//////////////////////////////////////////////////////////
// Funcion que evalua un valor x en un polinomio A      //
//////////////////////////////////////////////////////////
// x = valor que deseamos calcular                      //
// A = vector de coeficientes                           //
// NOTA: Los coeficientes del vector van de izquierda   //
// a derecha, de mayor a menor grado                    //
//////////////////////////////////////////////////////////

function px = UN_horner(A, x)
    px = A(1)
    for i = 2 : length(A)
        px = A(i) + x*px
    end
endfunction

//////////////////////////////////////////////////////////
// Esta funcion calcula la derivada de un polinomio     //
//////////////////////////////////////////////////////////
// A = vector de coeficientes                           //
// NOTA: Los coeficientes del vector van de izquierda   //
// a derecha, de mayor a menor grado                    //
//////////////////////////////////////////////////////////

function dp = UN_derivada_poli(A)
    dp = zeros( 1, length(A)-1 )
    n = length(dp)
    for i = 1 : length(dp)
        dp(i) = A(i)*n
        n = n - 1
    end
endfunction

//////////////////////////////////////////////////////
// Funcion que dado un x permite calcular una       //
// aproximacion de e^x                              //
//////////////////////////////////////////////////////
// x = valor que queremos calcular                  //
// eps = epsilon                                    //
// M = maxima cantidad de iteracion                 //
//////////////////////////////////////////////////////

function ex = UN_exp(x,eps,M)
    printf(  "---------------------------------------------------------\n" )
    printf(  " i \t\t Xi \t\t\t error\n" )
    printf(  "---------------------------------------------------------\n" )
    i = 0
    xb = x
    xa = 1
    while i < M & eps <= abs( (xb - xa) / xb )
        if i == 0
            printf( " %d\t %.15f\t-------------------------\n", i, xa ) 
        else
            xb = xa
            xa = xb + ( (x)^i )/factorial(i)
            printf( " %d\t %.15f\t %.15f\n", i, xa, abs( (xb - xa) / xb ) )
        end
        i = i + 1
    end
    ex = xa
    printf(  "---------------------------------------------------------\n" )
    if i == M
        printf( "¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "¡EXITO! el cálculo no fue exitoso, la mejor aproximación\n" )
    end
    printf( "de la exponencial de %.5f es: %.20f\n", x, ex )
    printf(  "---------------------------------------------------------\n" )
endfunction

