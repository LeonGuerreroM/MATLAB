clc;
clear;
close all;

fm = 50;
fc = 500;
T = 1/fm;
fs=50*60;
ts = 1/fs;
t = 0:ts:(4/100);


%% Segunda parte Miercoles 10 Abr 19 Modulacion de Banda Angosta

wc=2*pi*6000;
wm=100*2*pi;
b=20;

% a) Graficar y_em(t) en t = 0:ts:4/100;

yem_t=10*cos(wc.*t+b*sin(wm.*t));
figure(1);
subplot(2,1,1);
plot(t,yem_t,'linewidth',2,'color','r');
title("Señal");
xlabel("Tiempo[s]");
ylim([-10,11.5]);
grid on;

% b) Obtener y graficar |Y_em(f)|

N = 10000;
Yem_w  = fftshift(fft(yem_t,N))*ts; %fast fourier transform, saca el espectro y lo centra o ajusta de acuerdo al segundo parametro
f = linspace(-fs/2, fs/2,N); %genera un vector de -f/2 a f/2 espaciado en intervalos de N
figure(1);
subplot(2,1,2);
plot(f,abs(Yem_w),'g:','linewidth',2); %grafica la transformada en el vector generado por el linspace
title("Espectro");
xlabel("Frecuencia[Hz]");
grid on;

% c) Obtener y graficar yem2(t)

yem2_t = 0;
for n = -(b+1):(b+1)
    J = besselj(n,b); %calcula la funcion de bessel para B en n
    yem2_t = yem2_t+J*cos(2*pi*(fc+n*fm).*t);
end

yem2_t = 10*yem2_t;
figure(2);
subplot(2,1,1);
plot(t,yem2_t,'linewidth',2,'color','r');
title("Señal modulada en banda angosta");
xlabel("Tiempo[s]");
ylim([-10,11.5]);
grid on;

% d) Obtener y graficar |Y_em2(f)|

Yem2_t = fftshift(fft(yem2_t,N))*ts;
f = linspace(-fs/2,fs/2,N);
figure(2);
subplot(2,1,2);
plot(f,abs(Yem2_t),'g:','linewidth',2);
%xlim([-15000,15000]);
title("Espectro");
xlabel("Frecuencia[Hz]");
grid on;

% f) Calcular y estimar el Ancho de Banda de la primera señal
B_fm = 2*(b+1)*100 %formnula de Carson


