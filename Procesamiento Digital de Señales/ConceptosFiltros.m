%Graficar al respuesta en frecuencia del sistema
%se tiene una señal con respuesta al impulso infinita (sistema FIR --> respuesta la impulso finita)
%h(n)=(1/4)^n*u(n)
%H(Z)=1/(1-1/4*z^-1) ROC: |z|>1/4
%H(w)=1/(1-1/4*e-j*w) ---> respuesta en frecuencia
w=-pi:0.001:pi;
H=1./(1-0.25*exp(-j*w));
figure(1);
plot(w,abs(H));
axis([-pi,pi,0,5/3]);
n=0:49; %filtro IIR
h=(1/4).^n;
%se hara la convolucion con el coseno (señal de entrada) y la respuesta al impulso  
%para obtener la señal de salida del sistema
n=0:300;
x=cos(pi*n/3);%w=pi/3 %El filtro reacciona de acuerdo a la frecuencia de
%la señal de entrada, dando como amplitud la altura de la figura 1 de esa
%frecuencia. Con una amplitud diferente del coseno, se multiplica por esa
%A. Respuesta en frecuencia, dice cuando se amplifica o atenua cierta
%frecuencia. Las primeras muestras y las ultimas (transitorios) no muestran
%el comportamiento real de la señal filtrada
%x=cos(0*n/3)
%Acos(wn+B)
%Acos(2pi*fn+B)
y=conv(x,h);
figure(2);
subplot(211);
stem(x);
subplot(212);
stem(y);