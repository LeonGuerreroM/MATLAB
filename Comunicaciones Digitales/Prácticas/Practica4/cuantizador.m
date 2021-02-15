function cuantizacion = cuantizador(umbrales, niveles, senial)

L = length(niveles) - 1;
niveles(L+1) = [];
umbrales(L+1) = [];
umbrales(1) = [];


[indices, cuantizacion] = quantiz(senial, umbrales, niveles);