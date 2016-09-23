function h = gaussFilter(n1,n2,std)
for i = 1 : n2 
    for j = 1 : n1
        u = [j-(n1+1)/2 ;i-(n2+1)/2];
        h(i,j) = gauss(u,std);
    end
end
h = h / sum(h(:));
end