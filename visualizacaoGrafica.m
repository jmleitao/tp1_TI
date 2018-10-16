function [x,y] = visualizacaoGrafica()
%Plots the audio (saxriff.wav)
%stereo or not
[y,fs] = audioread('saxriff.wav');

T = 1/fs;
[n,c] = size(y);

t = [0:(n-1)]*T;

if (c == 2)
    subplot(211);
    plot(t,y(:,1));
    title('Left Channel');
   
    subplot(212);
    plot(t,y(:,2));
    title('Right Chanenel');
    
   
else 
    plot(t,y);
    
end

