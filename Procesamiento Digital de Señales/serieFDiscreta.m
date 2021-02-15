clear all
close all
%x=[1,1/3,1/9,1/27,0,0,0];
%N=7;
%Ck=0;
%k=0:N-1;
N=50;
L=10;
A=1;
x=[A*ones(1,L),zeros(1,N-L)];
Ck=0;
k=-2*N:2*N;
for n=0:N-1
    Ck=Ck+1/N*x(n+1)*exp(-j*2*pi*k*n/N);
end 
n=0:N-1;
figure(1)
subplot(3,1,1)
stem(n,x)
%Espectro de magnitud
figure(1)
subplot(3,1,2)
stem(k,abs(Ck))
%espectro de fase 
figure(1)
subplot(313)
stem(k,angle(Ck))
%densidad espectral de potencia 
figure(2)
stem(k,(abs(Ck)).^2)
P1=sum(abs(Ck(1:N)).^2)
P2=sum(x.^2)/N