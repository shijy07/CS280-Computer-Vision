function [mag,theta] = derivative_gaussian_filter(I, sigma,hs)
% compute magnitude and theta of image I
Dx=[0 0 0;-1 0 1;0 0 0];
Dy=[0 -1 0;0 0 0; 0 1 0];
nc=size(I,3);
Hg=gaussFilter(hs,hs,sigma);
Hx=conv2(Hg,Dx,'same');
Hy=conv2(Hg,Dy,'same');
figure;
mesh(Hx);title('G*Dx')
figure;
mesh(Hy); title('G*Dy');
nc=size(I,3);



for c=1:nc
    diffx(:,:,c)=conv2(double(I(:,:,c)),Hx,'same');
    diffy(:,:,c)=conv2(double(I(:,:,c)),Hy,'same');
    mag(:,:,c)=sqrt(diffx(:,:,c).^2+diffy(:,:,c).^2);
end
theta=zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        if max(mag(i,j,:))==mag(i,j,1)
            theta(i,j)=atan(diffy(i,j,1)/diffx(i,j,1));
        else
            if max(mag(i,j,:))==mag(i,j,2)
             theta(i,j)=atan(diffy(i,j,2)/diffx(i,j,2)); 
            else
                theta(i,j)=atan(diffy(i,j,3)/diffx(i,j,3));
            end
        end
    end
end
for i=1:nc
    mag(:,:,i)=uint8((mag(:,:,i)-min(min(mag(:,:,i))))...
        /(max(max(mag(:,:,i)))-min(min(mag(:,:,i))))*255);
end

theta=theta-min(theta(:));

figure;
subplot(1,3,1), imshow(diffx(:,:,1),[]); title('x direction Channel R');
subplot(1,3,2), imshow(diffx(:,:,2),[]); title('x direction Channel G');
subplot(1,3,3), imshow(diffx(:,:,3),[]); title('x direction Channel B');
figure;
subplot(1,3,1), imshow(diffy(:,:,1),[]); title('y direction Channel R');
subplot(1,3,2), imshow(diffy(:,:,2),[]); title('y direction Channel G');
subplot(1,3,3), imshow(diffy(:,:,3),[]); title('y direction Channel B');