%% Ventana Bartlett
M = 101;
n=0:M-1;
w=1-2*abs(n-(M-1)/2)/(M-1); %Ventana Bartlett
stem(n,w);
w2 = bartlett(M); %Con funcion de Matlab
figure
stem(n,w2);
%% Diseños de filtros FIR por ventanas
clc;
clear;
close all;
M=101; %La ventana se escoge a partir de la M, que va a determinar el numero de muestras 
%para que mi filtro se acerca a venir de una señal que tiende a infinito. 
%Los filtros tienen poca memoria, asi que para un IIR utilizamos las
%respuestas anteriores del filtro, que equivale al numero de muestras
%soportadas por el filtro por el numero de respuestas anteriores
%consideradas
n=0:M-1;
wc=0.1*2*pi;%frecuencia de corte en 0.1
hd=(wc/pi)*sinc((wc*(n-(M-1)/2))/pi); %Respuesta al impulso necesaria. Entre pi para que sea funcion sampling
figure(1);
stem(n,hd);
title('Respuesta al impulso con ventana rectangular');

wb=bartlett(M)'; %Comilla porque la funcion de Matlab da un vector columna
h=hd.*wb;
%Calculando la transformada de la nueva h
w=-pi:0.001:pi; %saltos pequeños para que parezca una variable continua
H=0;
for nn=n
    H=H+h(nn+1)*exp(-j*w*nn); %+1 pork la muestra cero esta en 1
end
figure(2);
subplot(211);
stem(n,h);
subplot(212);
%plot(w/(2*pi),abs(H)); %filtro graficado en magnitud y en frecuencia
plot(w/(2*pi),20*log10(abs(H))); %Graficado en decibeles
grid on;
%Se desea la longitud del filtro en 1

%La transformada de Fourier es una funcion de una variable continua


H2=fft(h,6284); %transformada de h con 6284 muestras. Da el espectro de 0 a 2pi
figure(3)
plot(w/(2*pi),20*log10(abs(H2)))
H21=fftshift(H2)
figure(4)
plot(w/(2*pi),20*log10(abs(H21)))
