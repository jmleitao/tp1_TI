function main()

%EXERCISE 1
flag = 1; %1-'guitar.wav' 2-'homerBin.bmp' 3-'english.txt'
if flag == 1
    hist_audio('guitarSolo.wav');
elseif flag == 2 
       alfab = 0:1:255;
       hist_img('homerBin.bmp',alfab);
elseif flag == 3 
    alfab = ['A':'Z','a':'z'];
    hist_txt('english.txt',alfab);
end



%EXERCISE 2
flag2 = 10; %1-'guitar.wav' 2-'homerBin.bmp' 3-'english.txt'
if flag2 == 1
    y = hist_audio('guitarSolo.wav'); 
    entropia(y);
elseif flag2 == 2 
    alfab = 0:1:255;
    y = hist_img('homerBin.bmp',alfab);
    entropia(y);
elseif flag2 == 3   
    alfab = ['A':'Z','a':'z'];   
    y = hist_txt('english.txt',alfab);
    entropia(y);
end



%EXERCISE 4
flag4 = 10; %1-'guitarSolo.wav' 2-'homerBin.bmp' 3-'english.txt'
if flag4 == 1
    a = hist_audio('guitarSolo.wav');
    p = a/sum(a); 
    b = hufflen(a);
    nbps = sum(p .* b) %Sum pi * li
    Variancia = var(b)
    
elseif flag4 == 2
    alfab = 0:1:255;
    a = hist_img('kid.bmp',alfab); %Alterar Ficheiro if needed
    p = a/ sum(a);
    b = hufflen(a);
    nbps = sum(p.* b) 
    Variancia = var(b)
    
elseif flag4 == 3 
    alfab = ['A':'Z','a':'z'];
    a = hist_txt('english.txt',alfab);
    p = a/sum(a);
    b = hufflen(a);
    nbps = sum(p.* b)
    Variancia = var(b)
end
 
 %EXERCISE 5
 
flag5 =10;
if flag5 == 1
    y = audioread('guitarSolo.wav');
    info = audioinfo('guitar.wav');
    bits = info.BitsPerSample;
    nbits = 2^bits;
    
    groupingsymbols(y,nbits)

elseif flag5 == 2
    y = imread('kid.bmp');
    nbits = 256;
    
    groupingsymbols(y,nbits)
elseif flag5 == 3
    
    file = fopen('english.txt');
    y = fscanf(file,'%c');
    nbits = 8;
    groupingsymbols(y,nbits)
end


%Exercise 6
flag6 = 10;
if flag6 == 1
    query = [2 6 4 10 5 9 5 8 0 8];
    target = [6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4 3 2 2 7 3 5 2 7 4 9 9 6];
    alfa = 0 : 10;
    step = 1;
    vectors = zeros(length(target)-length(query)+1,1);
    for i=1 : length(target)-length(query)+1
        z = ex6a(query,target,alfa,step);
        vectors(i) = z;
        step = step+1;
    end
    
    disp(vectors);  

%exercise 6 b)

elseif flag6 == 2
        query = audioread('guitarSolo.wav');
        file = input('-->Filename');
        
        target = audioread(file);
        step = round(length(query)/4);
        step2 = 1;
        info = audioinfo(file);
        bits = info.BitsPerSample;
        d = 2 / (2^bits);
        alfa = -1:d :1-d;
        contador = 1;
       
        vectors = zeros(length(target)-length(query)+1,1);
        
    for i=1 :step:(length(target)-length(query)+1) %nao era 1 a 1 mas step em step!
        z = ex6a(query,target,alfa,step2);
        vectors(contador) = z;
        contador = contador + 1;
        step2 = step2+step;
       
        
    end
        vectors(vectors == 0) = [];
        plot(1:length(vectors),vectors)
        title(sprintf('%s',file));
        xlabel('Janelas');
        ylabel('Informação Mútua');

        
% Exercise 6 c)
elseif flag6 == 3
    MaxVector = zeros(7:1);
    query = audioread ('guitarSolo.wav');
    contador = 1;
    
    for i=1: 7
    file = input('-->Filename');
    target = audioread(file);
    step = ceil(length(query))/4;
    step2 = 1;
    info = audioinfo(file);
    bits = info.BitsPerSample;
    d = 2 / (2^bits);
    alfa = -1:d :1-d;
    
    vectors = zeros(length(target)-length(query)+1,1);
    for j=1 :step:(length(target)-length(query)+1)        %step em step!
        z = ex6a(query,target,alfa,step2);
        vectors(contador) = z;
        contador = contador +1 ;
        step2 = step2 + step;
    end
    
    vectors(vectors == 0) = [];
    plot(1:length(vectors),vectors)
    scatter(1,0.37777);
    title(sprintf('%s',file));
    xlabel('Janelas');
    ylabel('Informação Mútua');
    
    Max = max(vectors);
    MaxVector(i) = Max;
    
    end 
    disp(sort(MaxVector,'descend'));
    
end