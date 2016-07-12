//////////////////////////////////////////////////////////////////////////
// Función que permite obtener la mejor linea recta y=Ax+B de un        //
// conjunto de puntos por el metodo de los minimos cuadrados            //
//////////////////////////////////////////////////////////////////////////
// *Vector donde se encuentran los puntos en x, X = [x1, x2, . . . , xn]//
// *Vector donde se encuentran los puntos en y, Y = [y1, y2, . . . , yn]//
//////////////////////////////////////////////////////////////////////////
// * A: Pendiente de la recta                                           //
// * B: Punto de origen                                                 //
//////////////////////////////////////////////////////////////////////////

function [A,B] = UN_ajuste_lineal(X,Y)
    R = [ sum( X ) sum( Y ) sum( X.^2 ) sum( X.*Y )  length( X ) ]
    A = ( R(1) * R(2) - R(5) * R(4) ) / ( R(1)**2 - R(5) * R(3) )
    B = ( R(2) - A * R(1) ) / R(5)
endfunction

//////////////////////////////////////////////////////////////////////////
// Función que permite obtener la mejor función potencial (y = Ax^M)    //
// de un conjunto de puntos por el metodo del ajuste potencial          //
//////////////////////////////////////////////////////////////////////////
// *Vector donde se encuentran los puntos en x, X = [x1, x2, . . . , xn]//
// *Vector donde se encuentran los puntos en y, Y = [y1, y2, . . . , yn]//
// *M es un valor constante.                                            //
//////////////////////////////////////////////////////////////////////////
// * A: Coeficiente de la curva de la funcion potencial                 //
//////////////////////////////////////////////////////////////////////////

function A = UN_ajuste_potencial(X,Y,M)
    A = sum( (X.^M).*Y ) / sum( X.^(2*M) )
endfunction

//////////////////////////////////////////////////////////////////////////
// Función que permite obtener la mejor función exponencial (y = Ce^Ax) //
// de un conjunto de puntos por el metodo del ajuste potencial          //
//////////////////////////////////////////////////////////////////////////
// *Vector donde se encuentran los puntos en x, X = [x1, x2, . . . , xn]//
// *Vector donde se encuentran los puntos en y, Y = [y1, y2, . . . , yn]//
//////////////////////////////////////////////////////////////////////////
// * A: Constante que acompaña a la exponencial                         //
// * C: Coeficiente de la curva de la funcion exponencial               //
//////////////////////////////////////////////////////////////////////////

function [A,C] = UN_ajuste_exponencial(X,Y)
    Y = log( Y )
    [A,C] = UN_ajuste_lineal( X, Y )
    C = %e ** C
endfunction

//////////////////////////////////////////////////////////////////////////////
// Función que permite obtener la mejor curva parabólica                    //
// (y = Ax^2 + Bx + C) de un conjunto de puntos por medio del ajuste        // 
// polinomial                                                               //
//////////////////////////////////////////////////////////////////////////////
// *Vector donde se encuentran los puntos en x, X = [x1, x2, . . . , xn]    //
// *Vector donde se encuentran los puntos en y, Y = [y1, y2, . . . , yn]    //
//////////////////////////////////////////////////////////////////////////////
// A, B y C son los coeficientes del polinomio (y = Ax^2 + Bx + C)          //
//////////////////////////////////////////////////////////////////////////////

function [A,B,C] = UN_ajuste_parabolico(X,Y)
    R = [ sum( X.^4 ) sum( X.^3 ) sum( X.^2 ); 0 0 sum( X ); 0 0 length(X) ]
    R(2, 1) = R(1, 2)
    R(2, 2) = R(1, 3)
    R(3, 1) = R(2, 2)
    R(3, 2) = R(2, 3)
    S = [ sum( Y.*(X.^2) ); sum( Y.*X ); sum( Y ) ]
    [U,D] = UN_eliminacion_gauss(R,S)
    X = UN_sustitucion_regresiva(U,D)
    A = X(1); B = X(2); C = X(3)
endfunction
