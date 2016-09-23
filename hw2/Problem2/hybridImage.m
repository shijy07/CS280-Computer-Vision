function im12 = hybridImage(im1, im2, hs,sigma, alpha)
H1=gaussFilter(hs,hs,sigma);
H2=zeros(hs,hs);
H2((hs+1)/2,(hs+1)/2)=alpha;
H2=H2-H1;
im1=filter2(H1,im1,'same');
im2=filter2(H2,im2,'same');
figure;
imagesc(log(abs(fftshift(fft2(im1)))));
title('Filtered Image 1');
figure;
imagesc(log(abs(fftshift(fft2(im2)))));
title('Filgered Image 2');
im12=(im1+2*im2);
im12=im12-min(im12(:));
im12=uint8(im12/max(im12(:))*255);

figure;
imagesc(log(abs(fftshift(fft2(im12)))));
title('Hybrid Image');
end
