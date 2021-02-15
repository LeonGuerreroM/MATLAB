clc;
clear;
close all;

T = 10*(1/50);
fs = 1000;
t = 0:1/fs:T-1/fs;

x = sawtooth(2*pi*50*t,0.9);  
subplot(311)
x = sawtooth(2*pi*50*t,0.9); 
plot(t,-1*x, 'linewidth', 2, 'color', 'red')
title('Forma de onda');
xlabel('t')
ylabel('s(t)')
set(gca,'xtick',[])
set(gca,'ytick',[])
axis([0.018 0.03 0 1.2])

subplot(312)
plot(t,x, 'linewidth', 2, 'color', 'red'); 
title('Forma de onda reflejada');
xlabel('t')
ylabel('s(-t)')
set(gca,'xtick',[])
set(gca,'ytick',[])
axis([0.008 0.02 0 1.2])

subplot(313)
plot(t,x, 'linewidth', 2, 'color', 'red'); 
title('Respuesta al impulso de un filtro acoplado');
xlabel('t')
ylabel('h(t) = s(T-t)')
set(gca,'xtick',[])
set(gca,'ytick',[])
axis([0.008 0.02 0 1.2])