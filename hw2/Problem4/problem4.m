%%
%CS280 HW2 Problem 4
%Jiaying Shi
%shijy07@berkeley.edu
%
clear all;
close all;
clc;
%%
% IMG_FILE='seg_bsds_253027.jpg';%zibra
IMG_FILE='seg_bsds_3096.jpg';%plane
[img,map]=imread(IMG_FILE);
[mag,theta]=difference_filter(img);
figure;
image(mag),title('Gradient Magnitude');
imwrite(mag,['Mag_',IMG_FILE],'JPEG');
figure;
image(theta),title('Gradient Orientation');
imwrite(theta,['Theta_',IMG_FILE],'JPEG');

max_mag=max(mag(:));
mag(:)


