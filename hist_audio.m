function[a] = hist_audio(file)

y = audioread(file);
info = audioinfo(file);
bits = info.BitsPerSample;
d = 2 / (2^bits);
% 2 porque -1 a 1 vao 2, e dividir por 2^bits pela precisao

alfa = -1:d :1-d; %alfabeto de -1 a 1 de d em d
[a] = histc(y,alfa);
bar(alfa,a,'histc')
title('Histogram');
xlabel('Alfabet');
ylabel('Occurrences');
