
% Epsilon
eps = [1:1:5]

% Paso
h = 0.1

% Contador
n = 1

% Condiciones iniciales
xn = 0 
yn = 1
vn = 0

for n = [1:1:200]

	yn1 = yn + h.*(-vn+eps.*(1-((vn).^2)).*yn);
	yn = yn1;

	xn(n) = n*h;

	vn1 = vn + h.*yn;
	vn = vn1;

	n = n+1;


endfor
