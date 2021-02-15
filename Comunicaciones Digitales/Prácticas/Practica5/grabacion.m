grabador = audiorecorder(8000, 16, 1);
disp("Grabando")
recordblocking(grabador, 6);
play(grabador);
grabado = getaudiodata(grabador);
audiowrite('segmento_voz.wav', grabado, 8000);