clc;
clear;
close all;

%% Declaracion variables generales

t = -0.015:1/1e7:0.015; %intervalo con intervalos muy chicos para simular un tiempo continuo
n = -100:100;
fs = 9000; %Frecuencia de muestreo en Hz

%% Modulacion

% a Graficacion de señales analogicas en t continuo
m_t = 5*cos(200*pi*t)+2*cos(400*pi*t)+cos(800*pi*t);
c_t = cos(3600*pi*t);
figure(1);
subplot(211);
plot(t,m_t);
title("Señal moduladora m(t)");
subplot(212)
plot(t,c_t,'g');
title('Señal portadora c(t)');

%b, c Muestreo de señales analogicas
m = 5*cos(200*pi*n/fs)+2*cos(400*pi*n/fs)+cos(800*pi*n/fs);
c = cos(3600*pi*n/fs);
figure(2);
subplot(211);
stem(n,m);
title("Señal moduladora muestreada m(n)");
subplot(212)
stem(n,c,'g');
title('Señal portadora muestreada c(n)');
%d Transformada de Fourier y muestra en Hz
M = fftshift(fft(m,1000)); %Transformada de fuorier invertida de la transformada de fourier de una señal
C = fftshift(fft(c,1000));
f = linspace(-fs/2,fs/2,1000); %Genera 1000 muestras en el intervalo de -fs/2 a fs/2 para mostrar las frecuencias en Hz

figure(3);
subplot(211);
plot(f,abs(M)) %el abs es para ignorar la parte compleja
title('Espectro M de la moduladora m(n)');
subplot(212);
plot(f,abs(C),'g') %el abs es para ignorar la parte compleja
title('Espectro C de la portadora c(n)');

%e Señal modulada de señales muestreadas
y = m.*c;

figure(4)
subplot(211);
stem(n,y);
title('Señal modulada y = m(n)*c(n)');

%f Espectro de la señal modulada
Y=abs(fftshift(fft(y,1000)));
subplot(212);
plot(f,abs(Y));
grid on;
title('Espectro Y');

%Diseño del filtro 

M = 101;
if mod(M,2)==0
    U = M/2 - 1;
else
    U = (M-1)/2;
end
Hr = [ 0.9 0.8 0.6 0.4 0.2 0.1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];

k = 0:U;
G = (-1).^k.*Hr;

h = G(1);
n = 0:M-1;

if mod(M,2)==0
    for k = 1:U
        h = h + ((-1).^(n+1))*G(M/2) - 2*G(k+1)*sin(2*pi*k*(n+0.5)/M);
    end
else
    for k = 1:U
        h = h + (-2*G(k+1)*sin(2*pi*k*(n+0.5)/M));
    end
end

h = h/M;

H = fftshift(fft(h,1000));
w = linspace(-pi, pi, 1000);
figure(5)

plot(w, 20*log10(abs(H)))
axis([-pi pi -2 5])
grid on;
title('Filtro Antisimetrico ');

%Eliminacion de bandas superiores
yssb = conv(y,h);
figure(6)
subplot(211)
stem(yssb)
axis([50 250 -4 4])
title('Señal modulada en SSB - LSB')

Yssb = fftshift(fft(yssb, 1000));
subplot(212)
plot(f,abs(Yssb));
title('Espectro señal modulada en ssb')

%% Demodulacion

%g Señal demodulada r = yssb*c
n1 = (50:250);
yssb = yssb(50:250);
r = yssb.*c;

figure(7)
subplot(211);
stem(n1,r);
title('Señal demodulada r = yssb(n)*c(n)');

%h Espectro de magnitud de r
R=abs(fftshift(fft(r,1000)));
subplot(212);
plot(f,abs(R));
title('Espectro R');

%i Diseño de un filtro y aplicacion
M = 100;
if mod(M,2)==0
    U = M/2 - 1;
else
    U = (M-1)/2;
end

Hr = [ 1 1 1 1 1 1 0.9 0.6 0.4 0.1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];

k = 0:U;
G = (-1).^k.*Hr;

h = G(1);
n = 0:M-1;

for k = 1:U
    h = h+ 2*G(k+1)*cos(2*pi*k*(n+0.5)/M);
end

h = h/M;

H = fftshift(fft(h,1000));
w = linspace(-pi, pi, 1000);
figure(8)

plot(w, 20*log10(abs(H)))
axis([-pi pi -40 5])
grid on;
title('Filtro Simetrico Pasa Bajas para esta señal');

%j Graficacion de m2 y su espectro 
m2 = 4*conv(r,h);
figure(9)
subplot(211)
stem(m2)
%axis([50 250 -2 2])
title('Señal moduladora recuperada')

M2 = fftshift(fft(m2, 1000));
subplot(212)
plot(f,abs(M2));
title('Espectro señal moduladora recuperada')



