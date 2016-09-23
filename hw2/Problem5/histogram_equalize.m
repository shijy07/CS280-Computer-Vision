function u = histogram_equalize(t)
% Minimally change values of t so that the result has a uniform distribution
N=imhist(t);
N=N/sum(N);
L=255;
m=size(t,1);
n=size(t,2);
for i=1:m
    for j=1:n
        value=0;
        for k=1:t(i,j)
            value=value+N(k);
        end
        u(i,j)=uint8(floor(255*value));
    end
end
