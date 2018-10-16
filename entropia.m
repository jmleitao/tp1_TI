function entropia(a)
%Function that calculates entropy
%Select on code which flag for each type of file

p = a/ sum(a);
p(p==0) = []; %Removes elemtns == 0
Entropy = -sum(p.*log2(p))
