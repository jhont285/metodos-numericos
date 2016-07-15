//////////////////////////////////////////////////////////////
// Función que permite obtener una aproximación a la        //
// solución y de la ecuación diferencial y'=f(t,y) en el    //
// intervalo [t0, tM] con condicion inicial y(t0)=y0        //
// utilizando el método de Euler.                           //
//////////////////////////////////////////////////////////////
// * tM es el punto donde se desea calcular la aproximación //
// de y.                                                    //
// * t0 es la abscisa del valor inicial                     //
// * y0 es la ordenada del valor inicial                    //
// * M es el número de particiones en el intervalo [t0, tM] //
// que definen h (el tamaño del paso).                      //
//////////////////////////////////////////////////////////////
// * E es la aproximación al resultado de la ecuacion       //
// diferencial                                              //
//////////////////////////////////////////////////////////////

function E = UN_ecua_dif_Euler(t0,y0,tM,M)
    h = (tM - t0)/M
    E = 0
    for i = 0:M
        ti = i*h + t0
        y0 = y0 + h*E
        E = f( ti, y0 )
    end
    E = y0
endfunction

//////////////////////////////////////////////////////////////
// Función que permite obtener una aproximación a la        //
// solución y de la ecuación diferencial y'=f(t,y) en el    //
// intervalo [t0, tM] con condicion inicial y(t0)=y0        //
// utilizando el Runge-Kutta de orden 4.                    //
//////////////////////////////////////////////////////////////
// * tM es el punto donde se desea calcular la aproximación //
// de y.                                                    //
// * t0 es la abscisa del valor inicial                     //
// * y0 es la ordenada del valor inicial                    //
// * M es el número de particiones en el intervalo [t0, tM] //
// que definen h (el tamaño del paso).                      // 
//////////////////////////////////////////////////////////////
// * RK4 es la aproximación al resultado de la ecuacion       //
// diferencial                                              //
//////////////////////////////////////////////////////////////

function RK4 = UN_ecua_dif_RK4(t0,y0,tM,M)
    h = (tM - t0)/M
    k = []
    RK4 = 0
    for i = 0: M
        ti = i*h + t0
        y0 = y0 + h*RK4
        k(1) = f( ti, y0 )
        k(2) = f( ti + h/2, y0 + (h*k(1) / 2) )
        k(3) = f( ti + h/2, y0 + (h*k(2) / 2) )
        k(4) = f( ti + h, y0 + (h*k(3) ) )
        RK4 = ( k(1)+k(4) + 2*( k(2) + k(3) ) ) / 6
    end
    RK4 = y0
endfunction
