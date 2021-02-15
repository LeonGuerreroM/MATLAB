clc
close all
clear

t = -1:0.0001:1;
audio = audioread('segmento_voz.wav'); %guardar la grabación en una variable

%% 1. Normalización de la señal, eliminación de componentes de CD y gráfica
absoluta = abs(audio);
audio = (audio/max(absoluta));
audio = audio-mean(audio);
figure(1)
plot(audio, 'r');
title("Señal de voz")
xlabel("Tiempo")
ylabel("Amplitud")

%% 2. Graficación del histograma normalizado
[elementos, centros] = hist(audio, 100);
ajuste = (elementos/length(audio))/((max(audio)-min(audio))/100); %rango dinámico entre número de celdas
figure(2)
bar(centros, ajuste, 'FaceColor', 'red');
hold on

%% 3. Varianza de la señal y distribuciones de probabilidad
varianza = var(audio)
sigma = sqrt(varianza);
gaussiana = (1./(sqrt(2*pi)*sigma)).*exp((-(1/2)).*(centros./sigma).^2);
plot(centros, gaussiana, 'linewidth', 2, 'color', 'blue');
hold on
laplaciana = (1./(sqrt(2)*sigma)).*exp((-1*((sqrt(2).*abs(centros))./(sigma))));
plot(centros, laplaciana, 'linewidth', 2, 'color', 'green');
hold on
gamma = sqrt(sqrt(3)./(8*pi*sigma.*abs(centros))) .* exp(-1*((sqrt(3)*abs(centros))./(2*sigma)));
plot(centros, gamma, 'linewidth', 2, 'color', 'cyan');
title("Estadisticas de la señal de voz")
legend('Histograma','Gaussiana','Laplaciana','Gamma')

%% 4. Cuantizador no uniforme de 16 niveles mediante Lloyd-Max
[niveles, cuantiza_escalar] = lloyds(audio, 16);
[niveles_carac, caracteristica] = quantiz(t, niveles, cuantiza_escalar);
figure(3)
stairs(t, caracteristica, 'linewidth', 2, 'color', 'red')
title('Cuantizador mediante Lloyd-Max');
xlabel('Umbrales de decisión');
ylabel('Niveles de Representación');

%% 5. Cuantizador no uniforme de 16 niveles con Ley A
A = 87.6;
pico = 1;

compresion = compand(t, A, pico, 'A/compressor');
[libro_codigo, particion] = paramCuantizador(1, -1, 16);
cuantizacion = cuantizador(particion, libro_codigo, compresion);
expansion = compand(cuantizacion, A, pico, 'A/expander');

figure(4)
stairs(t, expansion, 'linewidth', 2, 'color', 'red')
title('Cuantizador con Ley A');
xlabel('Umbrales de decisión');
ylabel('Niveles de Representación');

%% Cuantizacion del audio con ambos cuantizadores
[niveles_carac, caracteristica] = quantiz(audio, niveles, cuantiza_escalar);
figure(5)
plot(caracteristica, 'linewidth', 2, 'color', 'red')
title('Audio cuantizado con cuantizador por Lloyd-Max');
xlabel("Tiempo")
ylabel("Amplitud")

compresion = compand(audio, A, pico, 'A/compressor');
[libro_codigo, particion] = paramCuantizador(1, -1, 16);
cuantizacion = cuantizador(particion, libro_codigo, compresion);
expansion = compand(cuantizacion, A, pico, 'A/expander');
figure(6)
plot(expansion, 'linewidth', 2, 'color', 'red')
title('Audio cuantizado usando cuantizador con Ley A');
xlabel("Tiempo")
ylabel("Amplitud")