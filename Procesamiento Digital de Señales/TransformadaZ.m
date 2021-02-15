clear
close all
clc

%Lo siguiente se ingresa en potencias positivas
N=[1]; %Coeficiente del numerador
D=[1, -3/2, 1/2]; %Coeficientes del denominador
[A,p,R]=residuez(N,D) %Polos y A
