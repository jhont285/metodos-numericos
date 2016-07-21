format(15)

function fx = f(x)
    fx = -cos(x)
    return fx
endfunction

clc

disp("> df/dx usando la fórmula centrada de orden O(h^2)")

dfh2 = UN_primera_derivada_h2(%pi/4,0.01)
disp(dfh2)
    
disp("> df/dx usando la fórmula centrada de orden O(h^4)")

dfh4 = UN_primera_derivada_h4(%pi/4,0.01)
disp(dfh4)

disp("> d^2f/dx^2 usando la fórmula centrada de orden O(h^2)")

d2fh2 = UN_segunda_derivada_h2(%pi/4,0.01)
disp(d2fh2)

disp("> d^2f/dx^2 usando la fórmula centrada de orden O(h^4)")

d2fh4 = UN_segunda_derivada_h4(%pi/4,0.01)
disp(d2fh4)
