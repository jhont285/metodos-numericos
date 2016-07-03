//////////////////////////////////////////////////////////////
// Funcion que permite calcular la aproximacion de una raiz //
// de un polinimio por el método de la Newton-Raphson       //
//////////////////////////////////////////////////////////////
// A = vector de coeficientes del polinomio                 //
// x0 = valor inicial                                       //
// eps = epsilon                                            //
// M = maxima cantidad de iteraciones                       //
// NOTA: Los coeficientes del vector van de izquierda a     //
// derecha, de mayor a menor grado                          //
//////////////////////////////////////////////////////////////

function r = UN_newton(A, x0, eps, M)
    printf(  "---------------------------------------------------------\n" )
    printf(  " i \t\t Xi \t\t\t error\n" )
    printf(  "---------------------------------------------------------\n" )
    B = UN_derivada_poli( A ) 
    r = x0
    errorAbs = abs( UN_horner(A, r) )
    printf( " %d\t %.15f\t%.15f\n", 0, r, errorAbs )
    i = 1
    while i < M & eps <= errorAbs
        r = r - UN_horner(A, r) / UN_horner(B, r)
        errorAbs = abs( UN_horner(A, r) )
        printf( " %d\t %.15f\t%.15f\n", i, r, errorAbs )
        i = i + 1
    end   
    printf(  "---------------------------------------------------------\n" ) 
    if i == M
        printf( " FRACASO el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( " EXITO el cálculo fue exitoso, la mejor aproximación\n" )
    end
    printf( " de la raíz del polinimio es:\t %.20f\n", r )
    printf(  "---------------------------------------------------------\n" ) 
endfunction

//////////////////////////////////////////////////////////////
// Funcion que permite calcular la aproximacion de una raiz //
// de un polinimio por el método de la biseccion            //
//////////////////////////////////////////////////////////////
// A = vector de coeficientes del polinomio                 //
// x0 = valor inicial                                       //
// x1 = valor inicial diferente de x0                       //
// eps = epsilon                                            //
// M = maxima cantidad de iteraciones                       //
// NOTA: Los coeficientes del vector van de izquierda a     //
// derecha, de mayor a menor grado                          //
//////////////////////////////////////////////////////////////

function r = UN_secante(A, x0, x1, eps, M)
    printf(  "--------------------------------------------------------------------------\n" )
    printf(  " i \t\t Xi \t\t\t Xi+1 \t\t\t error\n" )
    printf(  "--------------------------------------------------------------------------\n" )
    i = 0
    errorAbs = eps + 1
    while i < M & eps <= errorAbs
        errorAbs = abs( UN_horner( A, x1 ) )
        r = x1 - ( UN_horner(A, x1) * ( x1 - x0 ) )/ ( UN_horner(A, x1) - UN_horner(A, x0) )
        printf( " %d\t %.15f\t %.15f\t%.15f\n", i, x0, x1, errorAbs )
        x0 = x1
        x1 = r
        i = i + 1
    end
    printf(  "--------------------------------------------------------------------------\n" )
    if i == M
    printf( "\t¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "\t¡EXITO! el cálculo fue exitoso, la mejor aproximación\n" )
    end
    printf( "\tde la raíz del polinimio es:\t %.20f\n", r )
    printf(  "--------------------------------------------------------------------------\n" )
endfunction

//////////////////////////////////////////////////////////////
// Funcion que permite calcular la aproximacion de una raiz //
// de un polinimio por el método de la regla falsa          //
//////////////////////////////////////////////////////////////
// A = vector de coeficientes del polinomio                 //
// a = extremo izquierdo del intervalo                      //
// b = extremo derecho del intervalo                        //
// eps = epsilon                                            //
// M = maxima cantidad de iteraciones                       //
// NOTA: Los coeficientes del vector van de izquierda a     //
// derecha, de mayor a menor grado                          //
//////////////////////////////////////////////////////////////


function r = UN_regla_falsa(A, a, b, eps, M)
    printf( "-------------------------------------------------------------------------------------------------------\n" )
    printf( " i \t lim Inferior \t\t lim Superior \t\t Valor Calculado \t\t error\n" )
    printf( "-------------------------------------------------------------------------------------------------------\n" )
    left = 0
    r = b - ( UN_horner(A, b) * (b-a) ) / ( UN_horner(A, b) - UN_horner(A, a) )
    errorAbs = abs( UN_horner(A, r) )
    if UN_horner(A, r) * UN_horner(A, b) < 0 then
        left = 1
        a = r
    else
        b = r
    end
    printf( " %d\t %.15f\t %.15f\t%.15f \t%.15f\n", 0, a, b, r, errorAbs );
    errorAbs = eps + 1
    i = 1
    while i < M & eps <= errorAbs 
        r = b - ( UN_horner(A, b) * (b-a) ) / ( UN_horner(A, b) - UN_horner(A, a))
        errorAbs = abs( UN_horner(A, r)  )  
        if left then
            a = r
        else
            b = r        
        end
        printf( " %d\t %.15f\t %.15f\t%.15f \t%.15f\n", i, a, b, r, errorAbs );
        i = i + 1
    end
    printf( "-------------------------------------------------------------------------------------------------------\n" )
    if i == M
    printf( "\t\t¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "\t\t¡EXITO! el cálculo fue exitoso, la mejor aproximación\n" )
    end
    printf( "\t\tde la raíz del polinimio es:\t %.20f\n", r )
    printf(  "-------------------------------------------------------------------------------------------------------\n" )
endfunction

//////////////////////////////////////////////////////////////
// Funcion que permite calcular la aproximacion de una raiz //
// de un polinimio por el método de la biseccion            //
//////////////////////////////////////////////////////////////
// A = vector de coeficientes del polinomio                 //
// a = extremo izquierdo del intervalo                      //
// b = extremo derecho del intervalo                        //
// eps = epsilon                                            //
// M = maxima cantidad de iteraciones                       //
// NOTA: Los coeficientes del vector van de izquierda a     //
// derecha, de mayor a menor grado                          //
//////////////////////////////////////////////////////////////


function r = UN_biseccion(A, a, b, eps, M)
    printf( "---------------------------------------------------------------------------------------------------\n" )
    printf( " i \t lim Inferior \t\t lim Superior \t\t Valor Calculado \t\t error\n" )
    printf( "---------------------------------------------------------------------------------------------------\n" )
    i = 0
    errorAbs = eps + 1
    while i < M  & eps <= errorAbs
        r = (a + b) / 2
        errorAbs = abs( UN_horner(A, r) )
        printf( " %d\t %.15f\t %.15f\t%.15f \t%.15f\n", i, a, b, r, errorAbs );
        if UN_horner(A, r) * UN_horner(A, b) < 0
            a = r
        else
            b = r
        end
        i = i + 1
    end
    printf( "---------------------------------------------------------------------------------------------------\n" )
    if i == M
        printf( "\t\t¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n" )
    else
        printf( "\t\t¡EXITO! el cálculo fue exitoso, la mejor aproximación\n" )
    end
    printf( "\t\tde la raíz del polinimio es:\t %.20f\n", r )
    printf( "---------------------------------------------------------------------------------------------------\n" )
endfunction

