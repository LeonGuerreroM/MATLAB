clc;
clear;
close all;

StopTime = 1;
FrameSize = 5*1e5;
EbNo_db=0:9;
EbNo = 10.^(EbNo_db/10);
tic

%% Medicion de BER P-NRZ (Eb=1)
Pb = qfunc(sqrt(2*EbNo));
p1 = semilogy(EbNo_db, Pb, 'b', 'linewidth', 2, 'DisplayName', 'P-NRZ');
title('Tasa de error de bit'), xlabel('E_b/N_o (dB)'), ylabel('P_b')
grid on, hold on

for k=1:length(EbNo_db)
    EbNo_k = EbNo_db(k);
    sim('C:\Users\León Mora\Desktop\Practica_10_BER_PNRZ');
    Pe(k)=ErrorVec(1);
    semilogy(EbNo_db(1:k), Pe(1:k), 'o', 'MarkerFaceColor', 'r')
    drawnow
end
toc

%% Medicion de BER U-NRZ (Eb=1/2)
Pb = qfunc(sqrt(2*EbNo));
p1 = semilogy(EbNo_db, Pb, 'b', 'linewidth', 2, 'DisplayName', 'P-NRZ');
title('Tasa de error de bit'), xlabel('E_b/N_o (dB)'), ylabel('P_b')
grid on, hold on

for k=1:length(EbNo_db)
    EbNo_k = EbNo_db(k);
    sim('C:\Users\León Mora\Desktop\Practica_10_BER_PNRZ');
    Pe(k)=ErrorVec(1);
    semilogy(EbNo_db(1:k), Pe(1:k), 'o', 'MarkerFaceColor', 'r')
    drawnow
end
toc