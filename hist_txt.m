function[hist] = hist_txt(y,alfab)
%Function That Creates Histogram of Text
    file = fopen(y);
    
    l = textscan(file,'%c');
    hist = zeros(length(alfab),1);
    for k=1:length(alfab)
       [i] = find([l{:}] == alfab(k));
       hist(k) = length(i);
    end
    bar(hist)
    title('Histogram');
    xlabel('Alfabet');
    ylabel('Occurrences');