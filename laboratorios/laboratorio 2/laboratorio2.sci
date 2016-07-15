//////////////////////////////////////////////////////////////
// Funcion que permite hallar la solucion de un sistema de  //
// la forma UX = B mediante el método de sustitución        //
// regresiva                                                //
//////////////////////////////////////////////////////////////
// * U es una matriz triangular superior no singular        //
// * B un vector columna                                    //
//////////////////////////////////////////////////////////////

function X = UN_sustitucion_regresiva(U,B)
    N = length(B)
    X = zeros( N, 1 )
    for k = N: -1: 1
        suma = 0
        for j = k + 1: N
            suma = suma + U(k, j) * X(j)
        end
        X(k) = ( B(k) - suma ) / U(k, k)
    end
endfunction

//////////////////////////////////////////////////////////////
// Funcion que permite hallar la solucion de un sistema de  //
// la forma LX = B mediante el método de sustitución        //
// progresiva                                               //
//////////////////////////////////////////////////////////////
// * L es una matriz triangular inferior no singular        //
// * B un vector columna                                    //
//////////////////////////////////////////////////////////////

function X = UN_sustitucion_progre(L,B)
    N = length(B)
    X = zeros( N , 1 )
    for k = 1 : N
        suma = 0
        for j = 1 : k-1
            suma = suma + L(k, j) * X(j)
        end
        X(k) = ( B(k) - suma ) / L(k,k)
    end
endfunction

//////////////////////////////////////////////////////////////
// Función que calcula un sistema UX = C equivalente        //
// al sistema AX = B, utilizando eliminación de Gauss       //
// aplicada sobre el sistema AX = B                         //
//////////////////////////////////////////////////////////////
// * A es una matriz no singular                            //
// * B es vector columna                                    //
//////////////////////////////////////////////////////////////

function [U,C] = UN_eliminacion_gauss(A,B)
    R = [A B]
    N = length(B)
    for i = 1: N - 1
        [ maxi, pos ]  = max( abs( R(i + 1: N, i) ) )
        if maxi > abs( R(i,i) ) then
            aux = R(i,:)
            R(i,:) = R( pos + i,:)
            R( pos + i, :) = aux
        end
        
        for j = i + 1: N
            k = R(j,i) / R(i,i)
            R(j,:) = R(j,:) - k * R(i,:)
        end

    end 
    U = R(1:N,1:N)
    C = R(:,N+1)
endfunction

//////////////////////////////////////////////////////////////
// Función que permite factorizar en la forma LU una        //
// matriz A                                                 //
//////////////////////////////////////////////////////////////
// * A es una matriz no singular                            //
//////////////////////////////////////////////////////////////

function [L,U] = UN_factorizacion_LU(A)
    [N,M] = size( A )
    L = eye( N, N )
    for i = 1: N
        for j = i + 1: N
            L(j,i) = A(j,i) / A(i,i)
            A(j,:) = A(j,:) - L(j,i) * A(i,:)
        end
    end
    U = A
endfunction

//////////////////////////////////////////////////////////////
// Función que permite hallar la solución del               //
// sistema LUX = B.                                         //
//////////////////////////////////////////////////////////////
// * L es una matriz triangular inferior                    //
// * B es un vector columna                                 //
//////////////////////////////////////////////////////////////

function X = UN_solucion_LU( L, U, B)
    Y = UN_sustitucion_progre(L, B)
    X = UN_sustitucion_regresiva(U, Y)
endfunction

