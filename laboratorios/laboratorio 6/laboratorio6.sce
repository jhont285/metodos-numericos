format(12)

function dy = f(t,y)
    dy = y - t^2 + 1
    return dy
endfunction

function yt = y(t)
    yt = (t+1)^2 -0.5*%e^t
    return yt
endfunction

clc

disp("> Una aproximación a la solución de la ecuación diferencial")
disp("  dy = y - t^2 + 1  usando el método de Euler es: ")

E = UN_ecua_dif_Euler(0,0.5,1,10)

disp(E)

disp("> Una aproximación a la solución de la ecuación diferencial")
disp("  dy = y - t^2 + 1  usando el método de Runge-Kutta es: ")

RK4 = UN_ecua_dif_RK4(0,0.5,1,10)

disp(RK4)

disp("> El valor de la solución exacta de la ecuación diferencia es: ")

disp(y(1))
