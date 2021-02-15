clc;
close all;
clear;

t = 0:0.00000001:2;
senial = sin(2*pi*t);
cuantizacion = 0;
xmin = -1;
xmax = 1;
L = 8;

[niveles, umbrales] = paramCuantizador(xmin, xmax, L);
figure(1);
stairs(umbrales, niveles);
xlabel('Umbrales de decisión');
ylabel('Niveles de Representación');
title("Caracteristica del cuantizador de 8 niveles");
axis([xmin xmax -1 1]);

cuantizacion = cuantizador(umbrales, niveles, senial);
figure(2);
plot(t, senial, 'b--');
hold on
plot(t, cuantizacion, 'r');
xlabel("Tiempo");
ylabel("Amplitud");
title("Señal seno cuantizada a 8 niveles")

ruido = senial-cuantizacion;
figure(3)
plot(t, ruido);
title("Ruido de cuantizacion por Q 8 niveles");

figure(4)
hist(ruido, 25)
title("Rudio de cuantizacion por Q 8 niveles");


L = 16;

[niveles, umbrales] = paramCuantizador(xmin, xmax, L);
figure(5);
stairs(umbrales, niveles);
xlabel('Umbrales de decisión');
ylabel('Niveles de Representación');
title("Caracteristica del cuantizador de 16 niveles");
axis([xmin xmax -1 1]);

cuantizacion = cuantizador(umbrales, niveles, senial);
figure(6);
plot(t, senial, 'b--');
hold on
plot(t, cuantizacion, 'r');
xlabel("Tiempo");
ylabel("Amplitud");
title("Señal seno cuantizada a 16 niveles")

ruido = senial-cuantizacion;
figure(7)
plot(t, ruido);
title("Ruido de cuantizacion por Q 16 niveles");

figure(8)
hist(ruido, 25)
title("Rudio de cuantizacion por Q 16 niveles");
