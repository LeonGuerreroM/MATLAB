%distribucion continua
clc, clear;
close all;

x=rand(1,1e6); %saca por default valores de 0 a 1, multiplicalo por cuanto quieres que sea el rango (al ancho. Por ejm de pi a pi se debe multiplicar por 2pi) y si quieres que cambie donde esta centrado, suma o resta. Funciona como una funcion pulso
%x=randn(1,1e7) distribucion normal funciona con corrimientos de señal.
%Multiplicar por la desviacion para cambiarla. Raiz de la varianza
%A=rand(1,1e6);
%Ax=-(1/3)*log(1-A); %ln
%figure(2);
%hist(Ax);
[a,b]=hist(x,50);

base=b(2)-b(1); %calculo de la base
area=sum(base*a); 
a=a/area; %formula general
bar(b,a,1); %graficacion con barras, el 1 es por la separacion entre las barras

%hist(x)
%var(x) varianza de la distribucion
%mean(x) valor esperado
