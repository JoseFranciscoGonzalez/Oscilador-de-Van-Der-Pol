%-----------------------------------------------------------------------------------------------%
% Analisis numerico - 95.04
% FIUBA - Universidad de Buenos Aires
% Trabajo Práctico 1
% González, José - Arribas, Guido
% Simulación de fórmulas cuadráticas
%-----------------------------------------------------------------------------------------------%

close all, clear all;
format long;
format compact;

%-----------------------------------------------------------------------------------------------%
% Datos ecuaciones a resolver
%-----------------------------------------------------------------------------------------------%

a = 1;																	% Coeficiente cuadrático

b = [-1000.001, -10000.0001, -100000.00001, -1000000.000001];				% Coeficiente lineal

c = 1;																	% Término independiente					

%-----------------------------------------------------------------------------------------------%

%-----------------------------------------------------------------------------------------------%
% Fórmulas
%-----------------------------------------------------------------------------------------------%

printf("\nSimulación de fórmulas cuadráticas\n\n")

for t = [6,4,1]

printf("\nX1 con %d digitos significativos:\n",t)
x1 = (-my_grid(b,t) + sqrt(((my_grid(b,t)).^2) - (4*my_grid(a,t)*my_grid(c,t))))/(2*my_grid(a,t))

printf("\nAlternativa X1 con %d digitos significativos:\n",t)
AX1 = ((-2*my_grid(c,t))./(my_grid(b,t)+sqrt((my_grid(b,t).^2) - (4*my_grid(a,t)*my_grid(c,t)))))

printf("\nX2 con %d digitos significativos:\n",t)
x2 = (-my_grid(b,t) - sqrt((my_grid(b,t).^2) - (4*my_grid(a,t)*my_grid(c,t))))/(2*my_grid(a,t))

printf("\nAlternativa X2 con %d digitos significativos:\n",t)
AX2 = ((-2*my_grid(c,t))./(my_grid(b,t)-sqrt((my_grid(b,t).^2) - (4*my_grid(a,t)*my_grid(c,t)))))

endfor

%-----------------------------------------------------------------------------------------------%



