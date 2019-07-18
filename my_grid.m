%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analisis numerico - 95.04
% FIUBA - Universidad de Buenos Aires
% Trabajo Práctico 1
% González, Jose - Arribas, Guido
% Funcion Grilla : Aplica a un numero N una grilla de punto flotante con una
% cantidad T de digitos significativos y redondeo simetrico.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ret_val = my_grid(number, significative_digits)

% Validación de datos de entrada
validateattributes(number,{'numeric'},{'nonempty'});
validateattributes(significative_digits,{'numeric'},{'scalar','integer','>=',0});

ret_val = number;

if(number < 0)
ret_val = -number;
endif

aux = 10.^(significative_digits-ceil(log10(ret_val)));
ret_val = round(ret_val.*aux)./aux;

if(number < 0)
ret_val = -ret_val;
endif

endfunction
