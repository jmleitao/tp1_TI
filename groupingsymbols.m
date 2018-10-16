function groupingsymbols(y,nbits)

y = double(y(:));
count = 1;
vector = zeros(ceil(length(y)/2),1);

for n=1 : length(y)/2
    z = y(count) *nbits + y(count+1);
   
    vector(n) = z; %Puts z on vector
    
    count = count + 2;   
end

a = unique(vector);
a = a';
[hist] = histcounts( vector, [a a(end)+1]);
bar(a,hist,'histc')

p = hist/ sum(hist);
p(p==0) = []; %Removes elemtns == 0
Entropy = -sum(p.*log2(p));
Entropy = Entropy/2 %Porque sao 2 simbolos
 
 



