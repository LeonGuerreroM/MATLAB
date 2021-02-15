clc;
clear;
close all;

t = -15:0.0001:15;

a = t>=2.5; 
b = t>=7.5;
c = a-b; %se debe hacer con variables y no con valores directos

d = t>=-7.5;
e = t>=-2.5;
f = d-e;

g = c+f;
plot(t, g, 'linewidth', 2, 'color', 'red');
title('Filtro pasabanda de banda angosta ideal')
xlabel('Frecuencia')
ylabel('|H(f)|')

axis([-11 11 -0.1 1.1]) %.1 puede ser suficiente para visualizar bien