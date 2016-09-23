function u = histogram_transfer(s,t)
% Minimally change values of t so that they have the same statistics as s
hs=imhist(s);
hs=hs/sum(hs);
ht=imhist(t);
ht=ht/sum(ht);
cums=cumsum(hs);
cums=floor(255*cums);
cumt=cumsum(ht);
cumt=floor(255*cumt);
m=size(t,1);
n=size(t,2);
hu=hs*m*n;

for i=1:m
    for j=1:n
        
        probt=cumt(t(i,j)+1);
        temp=abs(cums-probt);
        [minv,indx]=min(temp);        
        u(i,j)=uint8(indx-1);
    end
end
