function imPy=pyrimid(im,N)
m0=size(im,1);
n0=size(im,2);
h=gaussFilter(3,3,1);
imPy=im;
imtemp=im;
for i=2:N
    imBlur=filter2(h,imtemp,'same');
    m=size(imtemp,1);
    n=size(imtemp,2);
    imi=zeros(m0,floor(n/2));
    sampleMatrix=randi([0,3],floor(m/2),floor(n/2));
    for k=1:floor(m/2)
        for t=1:floor(n/2)
            ms=sampleMatrix(k,t);
            imi(k,t)=imBlur((k-1)*2+1+floor(ms/2),(t-1)*2+1+rem(ms,2));
        end
    end
    imtemp=imi(1:floor(m/2),1:floor(n/2));
    imPy=[imPy imi];
end


end