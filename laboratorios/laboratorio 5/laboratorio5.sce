function fx = f(x)
    fx = (exp(-(x^2)/2))/(sqrt(2*%pi))
    return fx
endfunction

clc

disp(">> Regla compuesta del trapecio")

T = UN_integral_trapecio(-3,3,106)

disp(T)

disp(">> Regla compuesta de 1/3 de Simpson")

S = UN_integral_simpson(-3,3,10)

disp(S)