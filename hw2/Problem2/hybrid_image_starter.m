clear all;
close all; % closes all figures
% IM1_FILE='malik.png';
% IM2_FILE='papadimitriou.png';
% IM1_FILE='monkey2.jpg';
% IM2_FILE='monkey1.jpg';
IM1_FILE='conan.jpg';
IM2_FILE='ironman.jpg';
% read images and convert to single format
im1 = im2single(imread(IM1_FILE));
im2 = im2single(imread(IM2_FILE));
im1 = rgb2gray(im1); % convert to grayscale
im2 = rgb2gray(im2);
% use this if you want to align the two images (e.g., by the eyes) and crop
% them to be of same size
[im2a, im1a] = align_images(im2, im1);

% uncomment this when debugging hybridImage so that you don't have to keep aligning
% keyboard; 

%% Choose the cutoff frequencies and compute the hybrid image (you supply
%% this code)
arbitrary_value = 100;
cutoff_low = arbitrary_value;
cutoff_high = arbitrary_value; 
im12 = hybridImage(im1a, im2a, 5,2,0.8);

%% Crop resulting image (optional)
figure, hold off, imagesc(im12), axis image, colormap gray
disp('input crop points');
[x, y] = ginput(2);  x = round(x); y = round(y);
im12 = im12(min(y):max(y), min(x):max(x), :);

figure, hold off, imagesc(im12), axis image, colormap gray
figure;
imagesc(log(abs(fftshift(fft2(im1a)))));
title('Image 1');
figure;
imagesc(log(abs(fftshift(fft2(im2a)))));
title('Image 2');

%% Compute and display Gaussian and Laplacian Pyramids (you need to supply this function)
N = 3; % number of pyramid levels (you may use more or fewer, as needed)
A=pyrimid(im12, N);
figure;
imshow(A,[]);