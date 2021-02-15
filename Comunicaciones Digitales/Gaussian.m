clc;
clear;
close all;

t = -10:0.0001:10;

gaussian = normpdf(t,0,1);

plot(t, gaussian, 'linewidth', 2, 'color', 'red')
axis([-3.5 3.5 0 0.41])
title('Distribución gaussiana con media 0');
