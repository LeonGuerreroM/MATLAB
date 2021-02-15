clear;
close all;
n = -20:20;
h=sinc(n/4);
H = 0;
w = -pi:0.001:pi;
for nn=n;
    H=H+h(nn+21)*exp(-j*w*nn); %porque el indice de los vectores empieza en 1
end
figure(1);
subplot(211);
stem(n,h);
subplot(212);
%plot(w,abs(H)); %en redianes
plot(w/(2*pi),abs(H)) %frecuencias (llamado frecuencias normalizadas)
%termina la creacion del filtro

wo=2*pi*0.2; %la fecuencia (numero decimal) indicado aqui, es lo que indica
%el valor de x cuyo valor de y se multiplicara por la señal
n=0:300;
x=cos(wo*n); %si metiera una señal con diferentes frecuencias, con los rizos, se distorisionaria la señal
%obviamente, se busca un filtro con rizos minimos
y=conv(x,h);
figure(2)
stem(y)

%filtros que tienden a infinitos cortados con ventanas rectangulares
%