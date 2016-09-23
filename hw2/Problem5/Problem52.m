%%
%CS280 HW2 Problem 5 part 2
%Jiaying Shi
%shijy07@berkeley.edu
%
clear all;
close all;
clc;
%%
IMG_FILE1='vangogh.jpg';
IMG_FILE2='pier_night.jpg';
img1=imread(IMG_FILE1);
img2=imread(IMG_FILE2);
for i=1:3
    img(:,:,i)=histogram_transfer(img1(:,:,i),img2(:,:,i));
end
figure;
subplot(3,3,1), imhist(img1(:,:,1)),title('R channel of s');
subplot(3,3,2), imhist(img2(:,:,1)),title('R channel of t');
subplot(3,3,3), imhist(img(:,:,1)),title('R channel of u');
subplot(3,3,4), imhist(img1(:,:,2)),title('G channel of s');
subplot(3,3,5), imhist(img2(:,:,2)),title('G channel of t');
subplot(3,3,6), imhist(img(:,:,2)),title('G channel of u');
subplot(3,3,7), imhist(img1(:,:,3)),title('B channel of s');
subplot(3,3,8), imhist(img2(:,:,3)),title('B channel of t');
subplot(3,3,9), imhist(img(:,:,3)),title('B channel of u');
figure;
subplot(1,3,1), imshow(img1)
subplot(1,3,2), imshow(img2)
subplot(1,3,3), imshow(img)
imwrite(img,'new.jpg','JPEG');

