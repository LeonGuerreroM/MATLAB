clc;
close all;
clear;

f=2;
T=1/f;
fs=50*f;
dt=1/fs;
t=(-2*T):dt:(2*T);


%x = sin(2*pi*f*t);
%x = 1*(t>-5 & t<5);
%x = square(2*pi*f*t);

x = sin(4000*pi*t)+sin(8000*pi*t)+sin(16000*pi*t)+sin(20000*pi*t);

subplot(211)
plot(t,x,'linewidth',2);
%axis([-T T -1 1]);
title('Señal f(t)')

w = (-f:0.001:f)*10*pi;
X=0;
n=0; %va tomando muestra de tiempo

for tt=t %ira recorriendo la variable tiempo de la señal
    n=n+1;
    X = X + x(n)*exp(-j*w*tt)*dt;
end

%Esto es para que calcule los Ck (coeficientes complejos de Fourier)
%para calcular el espectro o representacion en frecuencia de una señal
%periodica
%X = (1/T)*X;

X = fft(x,1024);

subplot(212)
%plot(w,abs(X),'linewidth',2, 'color', 'c')
plot(abs(X))
title('Transformada de Fourier')
