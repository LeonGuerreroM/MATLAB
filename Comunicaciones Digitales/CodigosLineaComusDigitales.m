clc;
clear;
close all;

%% Unipolar NRZ 
cadena = [0, 1, 1, 0, 1, 0, 0, 1, 0, 0];
Tb=1;
ts=Tb/14;
t=-1:1:8*Tb;

figure(1)
stairs(t,cadena, 'r')
title('Unipolar NRZ para 1101001 con Tb = 1')
axis([-0.2 7.2*Tb -0.5 1.5])

%% Polar NRZ o NRZ-L
cadena = [0, 1, 1, 0, 1, 0, 0, 1, 0, 0];
Tb=1;
ts=Tb/14;
t=-1:1:8*Tb;

figure(2)
for i=1:10
    if cadena(i) == 0
        cadena(i) = -1;
    end
end
stairs(t,cadena, 'r')
title('Polar NRZ para 1101001 con Tb = 1')
axis([-0.2 7.2*Tb -1.5 1.5])

%% Unipolar RZ usando Unipolar NRZ %hacerlo con concatenacion para ingresar nuevos valores del arreglo
cadena = [0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
Tb=1;
t=-1:0.5:8.5*Tb;

figure(3)
stairs(t,cadena, 'r')
title('Unipolar RZ para 1101001 con Tb = 1')
axis([-0.2 7.2*Tb -0.5 1.5])

%% Polar RZ usando Uniolar NRZ %hacerlo validando si el cero anterior es de 0 o de 1 para cambair a negativo
cadena = [-1, 0, 1, 0, 1, 0, -1, 0, 1, 0, -1, 0, -1, 0, 1, 0, -1, 0, -1, 0];
Tb=1;
ts=Tb/14;
t=-1:0.5:8.5*Tb;

figure(4)
stairs(t,cadena, 'r')
title('Polar RZ para 1101001 con Tb = 1')
axis([-0.2 7.2*Tb -1.5 1.5])

%% Bipolar RZ usando Uniolar NRZ
cadena = [0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0];
Tb=1;
ts=Tb/14;
t=-1:0.5:8.5*Tb;

figure(5)
stairs(t,cadena, 'r')
title('Bipolar RZ para 1101001 con Tb = 1')
axis([-0.2 7.2*Tb -1.5 1.5])

%% Manchester usando Uniolar NRZ
cadena = [0, 1, 1, -1, 1, -1, -1, 1, 1, -1, -1, 1, -1, 1, 1, -1, -1, 1, -1, 1];
Tb=1;
ts=Tb/14;
t=-1:0.5:8.5*Tb;

figure(5)
stairs(t,cadena, 'r')
title('Manchester para 1101001 con Tb = 1')
axis([-0.2 7.2*Tb -1.5 1.5])

%% Bipolar NRZ VS HDB3 usando unipolar NRZ
cadena = [0, 1, -1, 0, 0, 0, 0, 0, 1, 0, -1, 1, 0, 0, 0, 0, -1];
cadena1 = [0, 1, -1, 1, 0, 0, 1, 0, -1, 0, 1, -1, 0, 0, 0, -1, 1];
Tb=1;
ts=Tb/14;
t=-1:1:15*Tb;

figure(6)
subplot(211)
stairs(t,cadena, 'r')
title('Bipolar NRZ Tb = 1')
axis([-0.2 15*Tb -1.5 1.5])
subplot(212)
stairs(t,cadena1, 'r')
title('HDB3 Tb = 1')
axis([-0.2 15*Tb -1.5 1.5])

%% Bipolar NRZ VS B8ZS usando unipolar NRZ
cadena = [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1];
cadena1 = [0, 1, 0, 0, 0, 1, -1, 0, -1, 1, -1];
Tb=1;
ts=Tb/14;
t=-1:1:9*Tb;

figure(7)
subplot(211)
stairs(t,cadena, 'r')
title('Bipolar NRZ Tb = 1')
axis([-0.2 9*Tb -1.5 1.5])
subplot(212)
stairs(t,cadena1, 'r')
title('B8ZS Tb = 1')
axis([-0.2 9*Tb -1.5 1.5])

%% Espectro de NRZ Unipolar
clc;
close all;
clear;

f = 1;
A = 1;
Tb = 1;
w = 0:0.000001:5*pi*f;

P = (((A.*A).*Tb)/4).*((((sin(pi.*w.*Tb))./pi.*w.*Tb)).^2).*((1+(1/Tb)).*dirac(w));
p = (1/2).*(((sin(pi*w))./(pi*w)).^2).*(1+dirac(w));
plot(w, p, 'r', 'linewidth', 2)
title('Potencia Unipolar NRZ')
axis([0 2 0 0.5])

%% Espectro de NRZ Polar
clc;
close all;
clear;

f = 1;
A = 1;
Tb = 1;
w = 0:0.000001:5*pi*f;

p = (((sin(pi*w))./(pi*w)).^2);
plot(w, p, 'r', 'linewidth', 2)
title('Potencia Polar NRZ')
axis([0 2 0 1])

%% Espectro de NR Bipolar
clc;
close all;
clear;

f = 1;
A = 1;
Tb = 1;
w = 0:0.000001:5*pi*f;

p = (((sin(pi*w))./(pi*w)).^2).*((sin(pi*w)).^2);
plot(w, p, 'r', 'linewidth', 2)
title('Potencia Bipolar RZ')
axis([0 2 0 0.55])

%% Espectro de Manchester
clc;
close all;
clear;

f = 1;
A = 1;
Tb = 1;
w = 0:0.000001:5*pi*f;


p = (((sin((pi*w)./2))./((pi*w)./2)).^2).*((sin((pi*w)./2)).^2);
plot(w, p, 'r', 'linewidth', 2)
title('Potencia Manchester')
axis([0 2 0 0.55])
