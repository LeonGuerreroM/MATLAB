clc;
clear;
close all;
A=1; 
L=20;
w= (-1:0.01:1)*(2*pi);
X1=(A*sin(w*L/2)./sin(w/2).*exp(-j*w*(L-1)/2)).*(w~=0 & w~=-2*pi & w~=2*pi);
X1(101)=0
X2=A*L.*(w==0 | w==-2*pi | w==2*pi)
X=X1+X2
figure(1);
plot(w,abs(X));
hold on;

x=A*ones(1,L);
n=0:L-1;
X=0
for nn=n
    X=X+x(nn+1).*exp(-j*w*nn);
end
figure(2)
plot(w,abs(X))
plot(w, angle(X))
    
