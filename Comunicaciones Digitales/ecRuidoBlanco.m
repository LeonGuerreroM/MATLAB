clc;
clear;
close all;

t = -10:0.0001:10;
t1 = -2:2;

pot = (t>=-8)*2; %el componente de CD es normalmente una suma, con un valor de t
                  %a trozos es una multiplicación

figure(2)
plot(t, pot, 'linewidth', 2, 'color', 'red');
title('Densidad espectral de potencia del ruido blanco')
xlabel('Frecuencia (Hz)')
ylabel('Sw(f)')
axis([-5 5 0 4])


autocorrel = zeros(1,5);
autocorrel(1,3) = 1;

figure(3)
stem(t1, autocorrel, 'linewidth', 2, 'color', 'red');
title('Función de autocorrelación del ruido blanco')
xlabel('tao')
ylabel('Rw(tao)')
axis([-2 2 0 1])

