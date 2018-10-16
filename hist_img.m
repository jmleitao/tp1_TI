function[a] = hist_img(file,alfa)
%alfa = 0:1:255;

y = imread(file);
[a] = histc(y(:),alfa); % Counts Number of values in y that are within alfa
bar(alfa,a,'histc')
title('Histogram');
xlabel('Alfabet');
ylabel('Occurrences');



