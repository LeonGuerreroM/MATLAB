x1=0;
x2=5;
x3=10;
y1=0;
y2=5;
y3=0;

plot(x1,y1,'*');
plot(x2,y2,'*');
plot(x3,y3,'*');

xm=0;
ym=0;
for n=1:1e6;
    z=rand(1,1);
    if(z>=0 & z<(1/3))
        xm=(xm+x1)/2;
        ym=(ym+y1)/2;
    elseif(z>=(1/3) & z<(2/3))
            xm=(xm+x2)/2;
            ym=(ym+y2)/2;
    else 
        xm=(xm+x3)/2;
        ym=(ym+y3)/2;
end;
hold on;
plot(xm,ym,'ab');
pause(0.00001) %para que acepte un comando de interrupcion. De tiempo
end;
 