%-----------------------------------------------------------------------------------------------%
% Analisis numerico - 95.04
% FIUBA - Universidad de Buenos Aires
% Trabajo Práctico 2
% González, José - Arribas, Guido
% Simulación del método de Euler
%-----------------------------------------------------------------------------------------------%

close all, clear all; 
format long;
format compact;
graphics_toolkit('gnuplot')

%-----------------------------------------------------------------------------------------------%
% Fórmulas
%-----------------------------------------------------------------------------------------------%

eps = [1:1:5]
h = 0.1

n = 1

% Condiciones iniciales
xn = 0 
yn = 1
vn = 0


%-----------------------------------------------------------------------------------------------%

%-----------------------------------------------------------------------------------------------%
% Computo
%-----------------------------------------------------------------------------------------------%

for n = [1:1:200]
	yn1 = yn + h.*(-vn+eps.*(1-((vn).^2)).*yn);
	yn = yn1;

	xn(n) = n*h;

	vn1 = vn + h.*yn;
	vn = vn1;

	aux1(n) = vn(1);
	aux2(n) = vn(2);
	aux3(n) = vn(3);
	aux4(n) = vn(4);
	aux5(n) = vn(5);

	aux11(n) = yn(1);
	aux22(n) = yn(2);
	aux33(n) = yn(3);
	aux44(n) = yn(4);
	aux55(n) = yn(5);


	n = n+1;



endfor

%-----------------------------------------------------------------------------------------------%


%-----------------------------------------------------------------------------------------------%
% Ploteo
%-----------------------------------------------------------------------------------------------%

%grid minor
figure
	Hf = figure(1);
	set(Hf,'PaperUnits','inches','PaperPosition',[0 0 6.5 4]);

	Ha = axes;

	set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');
	grid on;	
	hold on;

s = 2;

	plot(xn(1:s:end),aux1(1:s:end),'bo','Markersize',5)
	plot(xn(1:s:end),aux2(1:s:end),'ro','Markersize',5)
	plot(xn(1:s:end),aux3(1:s:end),'go','Markersize',5)
	plot(xn(1:s:end),aux4(1:s:end),'ko','Markersize',5)
	plot(xn(1:s:end),aux5(1:s:end),'mo','Markersize',5)


ylabel('v ');
xlabel('t ');

Hleg = legend('e = 1 ','e = 2','e = 3','e = 4','e = 5',"location",'southwest');

set(Hleg,'FontName','Arial','FontSize',7);
set (Hleg, "textposition", "left");

print('metodo_euler','-dpng','-r300');


figure
	Hf = figure(2);
	set(Hf,'PaperUnits','inches','PaperPosition',[0 0 6.5 4]);

	Ha = axes;

	set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');
	grid on;	
	hold on;

s = 2;

	plot(aux1(1:s:end),aux11(1:s:end),'bo','Markersize',5)
	plot(aux2(1:s:end),aux22(1:s:end),'ro','Markersize',5)
	plot(aux3(1:s:end),aux33(1:s:end),'go','Markersize',5)
	plot(aux4(1:s:end),aux44(1:s:end),'ko','Markersize',5)
	plot(aux5(1:s:end),aux55(1:s:end),'mo','Markersize',5)


ylabel('v' ');
xlabel('v ');
grid minor;

Hleg = legend('e = 1 ','e = 2','e = 3','e = 4','e = 5',"location",'southeast');

set(Hleg,'FontName','Arial','FontSize',7);
set (Hleg, "textposition", "left");

print('metodo_euler2','-dpng','-r300');


%-----------------------------------------------------------------------------------------------%



