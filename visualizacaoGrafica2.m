function [x,y] = visualizacaoGrafica2(tlni,tFim)
%Plots the audio (saxriff.wav)
%stereo or not
[y,fs] = audioread('saxriff.wav');
T = 1/fs;
[n,c] = size(y); 
t = [0:(n-1)]*T;

if (nargin == 1)
     tpi = (tlni/T) + 1;
     tpi = max(1,tpi);
     tpi = min(n,tpi);
     
     plot (t(tpi:end),y(tpi:end,1));
      
elseif (nargin == 2)
    tpi = (tlni/T)+1;
    tpi = max(1,tpi);
    tpi = min(n,tpi);
    
    tpf = (tFim/T)+1;
    tpf = max(1,tpf);
    tpf = min(n,tpf);
    
    plot(t,y);
    axis ([tlni tFim -0.5 0.5]);
   
    %plot(t(tpi:tpf) , y(tpi:tpf));
   
else
    plot(t,y);    
end

    
   
