clc;
clear;
close all;

M = 15;

if mod(M,2)==0
    U = M/2 -1;
else
    U = (M-1)/2;
end

Hr = [1 1 1 1 1 0.5 0 0]; %Deben ser 8 muestras y se modifican las muestras segun el filtro que quiera
k = 0:U;
G = (-1).^k.*Hr;

h = G(1);
n = 0:M-1;

for k = 1:U
    h = h+ 2*G(k+1)*cos(2*pi*k*(n+0.5)/M);
end

h = h/M;


%% Respuesta en frecuencia

H = fftshift(fft(h,1000));
w = linspace(-pi, pi, 1000);

plot(w, 20*log10(abs(H)))
axis([-pi, pi, -100, 10])


% calcula wk

%% Ejercicio 
fs = 44100;
f1 = 1e4;
f2 = 13e3;
f3 = 18e3;

n = 0:200;
xn = 3*cos(2*pi*f1*n/fs)+5*sin(2*pi*f2*n/fs)+7*cos(2*pi*f3*n/fs);
y =  conv(xn,h); %convolucion del filtro y la señal, dara la respuesta en freucencia filtrada

y2 = 3*cos(2*pi*f1*n/fs)+5*sin(2*pi*f2*n/fs);


figure(3)
subplot(211)
stem(y)
subplot(212)
stem(y2);

Xn = fftshift(fft(xn,1000))
Y = fftshift(fft(y,1000))
F = linspace(-fs/2, fs/2, 1000) %en radianes es lo mismo multiplicado por 2*pi 


figure(4)
subplot(211)
plot(F,abs(Xn))
subplot(212)
plot(F,abs(Y))


