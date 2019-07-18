%---------------------------------------------------------------
%Funcion para calcular la solucion de una ecuacion diferencial
%mediante el Metodo de Nystrom

function [T U D]=tp2nystrom(Euler,fprima,a,b,u0,H)

%La funcion recibe otra funcion F para el calculo predictor de ui+1, que es el
%"punto siguiente" segun un metodo de paso simple.

%Los parametros a y b definen un intervalo.

% u0 Es un vector que define las condiciones iniciales
%(u0(1)=y0=y(T0),u0(2)=y0').

%El ultimo parametro h define el espaciado entre puntos del eje T.

if(nargin<5)
  fprintf("Cantidad de argumentos ingresados invalido. Recuerde que se debe cumplir a<b");
  return;
end

if(a>b)
  fprintf("Intervalo ingresado invalido. Recuerde que se debe cumplir a<b");
  return;
end

if(H<=0)
  fprintf("Espaciado ingresado invalido. Recuerde que se debe cumplir h>0");
  return;
end

  N=(b-a)/H;   
  %N es la cantidad de puntos en el intevalo [a,b].
  
  T=zeros(N+1,1);
  U=zeros(N+1,1);
  D=zeros(N+1,1);
    %Se definen 3 vectores: uno para cada punto del eje de tiempo (T),
  %otro para los valores estimados para cada "y" segun el metodo(U)
  %y por ultimo los valores de las derivadas estimados (D).
  
  U(1) = u0(1); 
  D(1) = u0(2);
  
  T=a:H:b;
  T=T';
  
  U(2)= u0(1) + H*u0(2) + H^2 /2 * ((1-U(1)^2)*D(1) - U(1)); 
  %Formula del libro de Gonzalez, pag 362.
 

 %Para no calcular n-1 veces lo mismo se decide realizar una vez el calculo de 
 %los un valores fuera del for y asignarlos a un vector

 prediccion_u=feval(Euler,fprima,a,b,u0,H); %Aqui se asume que la funcion a usar es la de Euler

 for i = 2:N    
    D(i)= (prediccion_u(i+1)- U(i-1))/ (2.0 *H); 
    U(i+1)=(2*U(i)-U(i-1)-(H^2)*U(i)-(H/2)*(1-(U(i)^2))*U(i-1))/(1-(H/2)*(1-(U(i)^2)));
   %Formula para metodo de nystrom
 end
end