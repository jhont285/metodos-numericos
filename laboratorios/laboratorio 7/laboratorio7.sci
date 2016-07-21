//////////////////////////////////////////////////////////////
// Función que permite obtener una aproximación a la primera//
// derivada (df/dx) de la función f en x, utilizando la     //
// fórmula centrada de orden O(h^2)                         //
//////////////////////////////////////////////////////////////
// * x es el valor para el cual se quiere calcular la       //
// derivada.                                                //
// * h es el incremento diferencial.                        //
//////////////////////////////////////////////////////////////
// * dfh2 es la aproximación al resultado de la derivada    //
// evaluada en un punto                                     //
//////////////////////////////////////////////////////////////

function dfh2 = UN_primera_derivada_h2(x,h)
    dfh2 = ( f( x+h ) - f( x-h ) ) / (2*h)
endfunction

//////////////////////////////////////////////////////////////
// Función que permite obtener una aproximación a la primera//
// derivada (df/dx) de la función f en x, utilizando la     //
// fórmula centrada de orden O(h^4)                         //
//////////////////////////////////////////////////////////////
// * x es el valor para el cual se quiere calcular la       //
// derivada.                                                //
// * h es el incremento diferencial.                        //
//////////////////////////////////////////////////////////////
// * dfh4 es la aproximación al resultado de la derivada    //
// evaluada en un punto                                     //
//////////////////////////////////////////////////////////////

function dfh4 = UN_primera_derivada_h4(x,h)
    dfh4 = ( -f(x+2*h) + 8*f(x+h) -8*f(x-h) + f(x-2*h) ) / (12*h)
endfunction

//////////////////////////////////////////////////////////////
// Función que permite obtener una aproximación a la segunda//
// derivada ((d^2)f/dx^2) de la función f en x, utilizando  //
// la fórmula centrada de orden O(h^2)                      //
//////////////////////////////////////////////////////////////
// * x es el valor para el cual se quiere calcular la       //
// derivada.                                                //
// * h es el incremento diferencial.                        //
//////////////////////////////////////////////////////////////
// * d2fh2 es la aproximación al resultado de la segunda    //
// derivada evaluada en un punto                            //
//////////////////////////////////////////////////////////////

function d2fh2 = UN_segunda_derivada_h2(x,h)
    d2fh2 = ( f(x+h) -2*f(x) +f(x-h) ) / (h ** 2)
endfunction

//////////////////////////////////////////////////////////////
// Función que permite obtener una aproximación a la segunda//
// derivada ((d^2)f/dx^2) de la función f en x, utilizando  //
// la fórmula centrada de orden O(h^4)                      //
//////////////////////////////////////////////////////////////
// * x es el valor para el cual se quiere calcular la       //
// derivada.                                                //
// * h es el incremento diferencial.                        //
//////////////////////////////////////////////////////////////
// * d2fh4 es la aproximación al resultado de la segunda    //
// derivada evaluada en un punto                            //
//////////////////////////////////////////////////////////////

function d2fh4 = UN_segunda_derivada_h4(x,h)
    d2fh4 = ( -f(x+2*h) + 16*f(x+h) -30*f(x) +16*f(x-h) -f(x-2*h) ) / ( 12*h ** 2 )
endfunction
