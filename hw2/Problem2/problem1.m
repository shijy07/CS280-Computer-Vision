%%
%CS280 HW2 Problem 1
%Jiaying Shi
%shijy07@berkeley.edu
%%
clear all;
clc;
% IMG_FILE='photo.jpg';
IMG_FILE='photo.jpg';
sigma=1;
hs=3;
hsize=[hs,hs];
gf=gaussFilter(hs,hs, sigma);

img=imread(IMG_FILE);
m=size(img,1);
n=size(img,2);

for c=1:3
    img_temp(:,:,c)=uint8(filter2(gf,img(:,:,c),'same'));
end
img_blur=img_temp;
img_diff=img-img_blur;
img_sharp=img_blur+1.5*img_diff;
figure;
subplot(2,2,1),imshow(img,[]),title('Original Image');
subplot(2,2,2), imshow(img_blur,[]),title('Blured Image');
subplot(2,2,3),imshow(img_diff*2,[]),title('Difference');
subplot(2,2,4), imshow(img_sharp,[]),title('Sharpened Image');
% imwrite(img_blur,'blur1.jpg');
% imwrite(img_sharp,'sharp1.jpg');
% imwrite(img_diff*4,'diff1.jpg');



