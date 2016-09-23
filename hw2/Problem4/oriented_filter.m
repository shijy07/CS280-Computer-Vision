function [mag,theta] = oriented_filter(I,sigma,hs)
% compute magnitude and theta of image I
D1=[0 0 0;-1 0 1;0 0 0];
D2=[0 -1 0;0 0 0;0 1 0];
D3=[-1 0 0;0 0 0;0 0 1];
D4=[0 0 -1;0 0 0;1 0 0];
Hg=gaussFilter(hs,hs,sigma);
H1=conv2(Hg,D1,'same');
H2=conv2(Hg,D2,'same');
H3=conv2(Hg,D3,'same');
H4=conv2(Hg,D4,'same');
figure;
subplot(2,2,1), mesh(H1);title('G*D1')
subplot(2,2,2), mesh(H2);title('G*D2');
subplot(2,2,3), mesh(H3);title('G*D3')
subplot(2,2,4), mesh(H4); title('G*D4');

nc=size(I,3);
for c=1:nc
    diff1(:,:,c)=conv2(double(I(:,:,c)),H1,'same');
    diff2(:,:,c)=conv2(double(I(:,:,c)),H2,'same');
    diff3(:,:,c)=conv2(double(I(:,:,c)),H3,'same');
    diff4(:,:,c)=conv2(double(I(:,:,c)),H4,'same');
    magxy=sqrt(diff1(:,:,c).^2+diff2(:,:,c).^2);
    magdig=sqrt(diff3(:,:,c).^2+diff4(:,:,c).^2);
    mag(:,:,c)=max(magxy,magdig);
end
theta=zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        if max(mag(i,j,:))==mag(i,j,1)
            theta(i,j)=atan(diff2(i,j,1)/diff1(i,j,1));
        else
            if max(mag(i,j,:))==mag(i,j,2)
             theta(i,j)=atan(diff2(i,j,2)/diff1(i,j,2)); 
            else
                theta(i,j)=atan(diff2(i,j,3)/diff1(i,j,3));
            end
        end
    end
end
for i=1:nc
    mag(:,:,i)=uint8((mag(:,:,i)-min(min(mag(:,:,i))))...
        /(max(max(mag(:,:,i)))-min(min(mag(:,:,i))))*255);
end

theta=single((theta-min(theta(:)))/pi*180);

figure;
subplot(1,3,1), imshow(diff1(:,:,1),[]); title('Filter 1 Channel R');
subplot(1,3,2), imshow(diff1(:,:,2),[]); title('Filter 1 Channel G');
subplot(1,3,3), imshow(diff1(:,:,3),[]); title('Filter 1 Channel B');
figure;
subplot(1,3,1), imshow(diff2(:,:,1),[]); title('Filter 2 Channel R');
subplot(1,3,2), imshow(diff2(:,:,2),[]); title('Filter 2 Channel G');
subplot(1,3,3), imshow(diff2(:,:,3),[]); title('Filter 2 Channel B');

figure;
subplot(1,3,1), imshow(diff3(:,:,1),[]); title('Filter 3 Channel R');
subplot(1,3,2), imshow(diff3(:,:,2),[]); title('Filter 3 Channel G');
subplot(1,3,3), imshow(diff3(:,:,3),[]); title('Filter 3 Channel B');
figure;
subplot(1,3,1), imshow(diff4(:,:,1),[]); title('Filter 4 Channel R');
subplot(1,3,2), imshow(diff4(:,:,2),[]); title('Filter 4 Channel G');
subplot(1,3,3), imshow(diff4(:,:,3),[]); title('Filter 4 Channel B');
end
