%%
%CS280 HW2 Problem 4 part 3
%Jiaying Shi
%shijy07@berkeley.edu
%
clear all;
close all;
clc;
%%
% IMG_FILE='bsds_253027.jpg';%zibra
IMG_FILE='bsds_3096.jpg';%plane
img=im2single(imread(IMG_FILE));
[mag,theta]=oriented_filter(img,4,21);
figure;
subplot(1,3,1),imshow(mag(:,:,1),[]),title('Gradient Magnitude Channel R');
subplot(1,3,2),imshow(mag(:,:,2),[]),title('Gradient Magnitude Channel G');
subplot(1,3,3),imshow(mag(:,:,3),[]),title('Gradient Magnitude Channel B');
figure;
imshow(theta,[]),title('Gradient Orientation');
imwrite(theta,['Thetag_',IMG_FILE],'JPEG');

max_mag=255;
threshold=0.2;
figure;
title('threshold: 0.4 of max magnitude');
mag1=mag;
mag1(mag1<threshold*max_mag)=0;
subplot(1,3,1),imshow(mag1(:,:,1),[]),title('Channel R');
subplot(1,3,2),imshow(mag1(:,:,2),[]),title('Channel G');
subplot(1,3,3),imshow(mag1(:,:,3),[]),title('Channel B');
threshold=0.4;
mag2=mag;
figure;
title('threshold: 0.6 of max magnitude');
mag2(mag2<threshold*max_mag)=0;
subplot(1,3,1),imshow(mag2(:,:,1),[]),title('Channel R');
subplot(1,3,2),imshow(mag2(:,:,2),[]),title('Channel G');
subplot(1,3,3),imshow(mag2(:,:,3),[]),title('Channel B');

threshold=0.6;
mag3=mag;
figure;
title('threshold: 0.8 of max magnitude');
mag3(mag3<threshold*max_mag)=0;
subplot(1,3,1),imshow(mag3(:,:,1),[]),title('Channel R');
subplot(1,3,2),imshow(mag3(:,:,2),[]),title('Channel G');
subplot(1,3,3),imshow(mag3(:,:,3),[]),title('Channel B');

theta1=theta;
theta2=theta;
theta3=theta;
t1=0.4;
t2=0.6;
t3=0.8;
max_theta=max(theta(:));
theta1(max(mag,[],3)<max_mag*t1)=0;
theta2(max(mag,[],3)<max_mag*t2)=0;
theta3(max(mag,[],3)<max_mag*t3)=0;

figure;
subplot(1,3,1),imshow(theta1,[]);title('threshold: 0.4 of max theta');
subplot(1,3,2),imshow(theta2,[]);title('threshold: 0.6 of max theta');
subplot(1,3,3),imshow(theta3,[]);title('threshold: 0.8 of max theta');