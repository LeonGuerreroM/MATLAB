clc; clear;
close all;

X=zeros(1,12); %llena un vector con ceros
Y=zeros(1,6);
Z=zeros(1,18);


N=1000;
tic %inicia un contador
for n=1:N
    d1=randi(6);
    d2=randi(6);

    x=d1+d2;
    y=max(d1,d2);
    z=x+y;
    
    X(x)=X(x)+1; %al dato que cayo, en su posicion en el arreglo (que es la misma que el dato) se le suma 1
    Y(y)=Y(y)+1;
    Z(z)=Z(z)+1;
end

X=X/N;
Y=Y/N;
Z=Z/N;


figure(1);
n=1:12;
stem(n,X); %la funcion stem es para graficar distribuciones discretas de datos

figure(2);
n=1:6;
stem(n,Y);

figure(3);
n=1:18;
stem(n,Z);
toc %para el contador. El aumento debe ser lineal

X(2)