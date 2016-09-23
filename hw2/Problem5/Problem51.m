%%
%CS280 HW2 Problem 5 part 1
%Jiaying Shi
%shijy07@berkeley.edu
%
clear all;
close all;
clc;
%%
IMG_FILE='beans.png';
img=imread(IMG_FILE);
for i=1:3
    eq_img(:,:,i)=histogram_equalize(img(:,:,i));
end
figure;
scale=0:255;
subplot(3,2,1), imhist(img(:,:,1)),title('R channel of t');
subplot(3,2,2), imhist(eq_img(:,:,1)),title('R channel of u');
subplot(3,2,3), imhist(img(:,:,2)),title('G channel of t');
subplot(3,2,4), imhist(eq_img(:,:,2)),title('G channel of u');
subplot(3,2,5), imhist(img(:,:,3)),title('B channel of t');
subplot(3,2,6), imhist(eq_img(:,:,3)),title('B channel of u');
figure;
image(eq_img)

imggray=rgb2gray(img);
eqGray=histogram_equalize(img(:,:,i));
figure;
subplot(1,2,1), imshow(imggray); title('Gray-Scale Image');
subplot(1,2,2), imshow(eqGray);title('Enhanced Gray-Scale Image');

figure;
subplot(1,2,1), imhist(imggray),title('Gray-Scale Histogram')
subplot(1,2,2), imhist(eqGray), title('Enhanced Gray-Scale Image Histogram');