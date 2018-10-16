function [I] =  ex6a (query,target,alfa,step)

sup = step + length(query);
temp = target(step:sup-1); %Ajustar limites do target ao tamanho do query

%((x - alfa(1)) / (alfa(2)-alfa(1)) )+1;

[histy] = histcounts(temp,[alfa alfa(end)+1]);
py = histy / sum(histy);
py(py==0) = 1;

[histx] = histcounts(query,[alfa alfa(end)+1]);
px = histx / sum(histx);
px(px==0) = 1; 
px = px';



count=1;
histxy = zeros(length(alfa));
for i=1 : (length(query))
    histxy(((query(count)- alfa(1)) / (alfa(2)-alfa(1)))+1, ((temp(count)- alfa(1)) / (alfa(2)-alfa(1)))+1) = histxy(((query(count)- alfa(1)) / (alfa(2)-alfa(1)))+1, ((temp(count)- alfa(1)) / (alfa(2)-alfa(1)))+1)+1;%Matriz Ocorrencias +1 
    count = count+1;
end


pxy = histxy/ sum(sum(histxy));

logvalue = pxy ./ (px.*py);
logvalue(logvalue==0) = 1; %log2 1 = 0, Nao pode ser [] senao matrizes ficam com tamanho diferente
I = sum(sum(pxy .* log2(logvalue)));
disp(I);


end

