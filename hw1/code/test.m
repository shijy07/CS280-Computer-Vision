%%
%Code for test affine_solve
%Jiaying Shi
%shijy07@berkeley.edu
%%
clear all;
clc;
%%
%prepare data
source=imread('source.jpg');
% imshow(source);
nx=size(source,1);
ny=size(source,2);
usource=[1,1309,1 1309;1,1,1309,1309];
[row, col,page]=find(source(:,:,1));
u=[row';col'];
timesquareori=imread('times_square.jpg');
vt(:,:,1)=[311,400,155,282;20,156,148,315];
vt(:,:,2)=[368,429,275,368;671,722,865,884];
vt(:,:,3)=[813,889,811,893;410,409,488,487];
vt(:,:,4)=[1148,1193,1172,1227;697,660,799,769];
vt(:,:,5)=[1026,1093,1035,1104;612,597,664,653];
hometownori=imread('target.jpg');
vh(:,:,1)=[1474,1541,1475,1541;529,529,577,576];
vh(:,:,2)=[468,514,468,515;605,608,653,652];
vh(:,:,3)=[968,1001,968,1002;445,445,488,488];
vh(:,:,4)=[1324,1379,1323,1380;738,744,816,827];
%%
%Affine transform
%
timesquare=timesquareori;
for i=1:size(vt,3)
    H=affine_solve(usource,vt(:,:,i));
    vtime=homography_transform(u,H);
    vtime=round(vtime);
    npixel=size(vtime,2);
    for j=1:npixel
        timesquare(vtime(2,j),vtime(1,j),:)=source(u(2,j),u(1,j),:);
    end
end
figure;
imshow(timesquare);
imwrite(timesquare,'times_square_affine.jpg');
hometown=hometownori;
for i=1:size(vh,3)
    H=affine_solve(usource,vh(:,:,i));
    vhome=homography_transform(u,H);
    vhome=round(vhome);
    npixel=size(vhome,2);
    for j=1:npixel
        hometown(vhome(2,j),vhome(1,j),:)=source(u(2,j),u(1,j),:);
    end
end
figure;
imshow(hometown);
imwrite(hometown,'myimage_affine.jpg');

%%
%Homography transform
timesquare=timesquareori;
for i=1:size(vt,3)
    H=homography_solve(usource,vt(:,:,i));
    vtime=homography_transform(u,H);
    vtime=round(vtime);
    npixel=size(vtime,2);
    for j=1:npixel
        timesquare(vtime(2,j),vtime(1,j),:)=source(u(2,j),u(1,j),:);
    end
end
figure;
imshow(timesquare);
imwrite(timesquare,'times_square_homography.jpg');
hometown=hometownori;
for i=1:size(vh,3)
    H=homography_solve(usource,vh(:,:,i));
    vhome=homography_transform(u,H);
    vhome=round(vhome);
    npixel=size(vhome,2);
    for j=1:npixel
        hometown(vhome(2,j),vhome(1,j),:)=source(u(2,j),u(1,j),:);
    end
end
figure;
imshow(hometown);
imwrite(hometown,'myimage_homography.jpg');
