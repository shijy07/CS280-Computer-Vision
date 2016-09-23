function u = histogram_transferLAB(s,t,L)
% Minimally change values of t so that they have the same statistics as s

hs=hist(s,L);
hs=hs/sum(hs);
ht=hist(t,L);
ht=ht/sum(ht);
cums=cumsum(hs);
cums=floor(L*cums);
cumt=cumsum(ht);
cumt=floor(L*cumt);
steps=(max(s(:))-min(s(:)))/(L-1);
stept=(max(t(:))-min(t(:)))/(L-1);
mint=min(t(:));
mins=min(s(:));
m=size(t,1);
n=size(t,2);
for i=1:m
    for j=1:n        
        probt=cumt(floor((t(i,j)-mint)/stept)+1);
        temp=abs(cums-probt);
        [minv,indx]=min(temp);        
        u(i,j)=stept*(indx-1)+mint;
    end
end
