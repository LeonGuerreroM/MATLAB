clc;
clear;
close all;
%N=6*8*14;
N=1024; %aproximamos a la potencia de dos mas cercana, rellenando con 0´s para que hafa la fft mas rapido
n=0:N-1;
w=linspace(-pi,pi,N); %divide un intervalo en muestras igualmente espaciadas
x=2*cos(pi*n/3)+5*cos(pi*n/4)+7*sin(pi*n/7);
X=fftshift(fft(x,N));
plot(w/(2*pi),abs(X));