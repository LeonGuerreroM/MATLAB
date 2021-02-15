clear all;
close all;

n=0:99;
x=(1/3).^n;

figure(1)
subplot(211)
stem(n,x)
title('x(n)')

w=-pi:0.01:pi;

X=1./(1-(1/3)*exp(-j*w));
subplot(212)
plot(w,abs(X))
title('Espectro de Magnitud de x(n)');

Wo=pi/2;
y=x.*cos(pi/4*n);
Y=0.5./((1-(1/3)*exp(-j*(w-Wo)))+0.5./(1-(1/3)*exp(-j*(w+Wo))));
figure(2)
plot(211)
stem(n,y);
title('y(n)=x(n)cos(pi*n/4)')
subplot(212)
plot(w,abs(Y));
title('Espectro de magnitud de y(n)')
axis([-pi,pi,0,max(abs(X))]);



