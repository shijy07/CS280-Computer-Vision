%%
%CS280 HW2 Problem 5 part 3
%Jiaying Shi
%shijy07@berkeley.edu
%
clear all;
close all;
clc;
%%
L=300;
IMG_FILE1='sf.jpg';
IMG_FILE2='sunflowers.jpg';
img1=imread(IMG_FILE1);
img2=imread(IMG_FILE2);
img1LAB=rgb2lab(img1);
img2LAB=rgb2lab(img2);
for i=1:3
    imgLAB(:,:,i)=histogram_transferLAB(img1LAB(:,:,i),img2LAB(:,:,i),L);
end
figure;
subplot(3,3,1), bar(hist(img1LAB(:,:,1),L)),title('L channel of s');
subplot(3,3,2), bar(hist(img2LAB(:,:,1),L)),title('L channel of t');
subplot(3,3,3), bar(hist(imgLAB(:,:,1),L)),title('L channel of u');
subplot(3,3,4), bar(hist(img1LAB(:,:,2),L)),title('A channel of s');
subplot(3,3,5), bar(hist(img2LAB(:,:,2),L)),title('A channel of t');
subplot(3,3,6), bar(hist(imgLAB(:,:,2),L)),title('A channel of u');
subplot(3,3,7), bar(hist(img1LAB(:,:,3),L)),title('B channel of s');
subplot(3,3,8), bar(hist(img2LAB(:,:,3),L)),title('B channel of t');
subplot(3,3,9), bar(hist(imgLAB(:,:,3),L)),title('B channel of u');
figure;
subplot(1,3,1), imshow(img1)
subplot(1,3,2), imshow(img2)
img=lab2rgb(imgLAB);
subplot(1,3,3), imshow(img)
imwrite(img,'newSF.jpg','JPEG');

