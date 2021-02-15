function [niveles, umbrales] = paramCuantizador(xmin, xmax, L)
%Regresa 

%Se calculan primero los intervalos 
delta = (xmax-xmin)/L;
umbrales = 0;
umbralActual = xmin;
%niveles1 = 0;
niveles = 0;
%bandera = 0;

for i=1:L+1
    umbrales(i) = umbralActual;
    umbralActual = umbralActual + delta;
end

for i=1:L
    nivel = (umbrales(i)+ umbrales(i+1))/2; 
    niveles(i) = nivel;
end

%niveles = niveles1;
niveles(L+1) = 0;

%añadimos 0 como nivel de representacion
% for i=1:L
%     if i == L & bandera == 1 %comentamos esto que era par ano perder el
%     %ultimo nivel, pero es justo lo que debemos hacer.
%         niveles(i+1) = niveles1(i);
%     end
%     if bandera == 1
%         niveles(i) = niveles1(i-1);
%     end
%     if i>1
%         if niveles1(i-1)<0 & niveles1(i)>0 
%             niveles(i) = 0;
%             bandera = 1;
%         end
%     end
% end

%quitamos 0 como umbral de decision
% for i=1:L+1
%     if umbrales(i) == 0
%         umbrales(i) = [];
%         break
%     end
% end

