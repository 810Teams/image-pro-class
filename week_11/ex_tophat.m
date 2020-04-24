%
% ex_tophat.m
%

clear all;
close all;

f = imread('img/rice.tif');
se = strel('disk', 12);
fo = imopen(f, se);
f2 = imsubtract(f, fo);
f22 = imtophat(f, se);

level = graythresh(f);
BW = imbinarize(f, level);
th = graythresh(f2);
BW_rice = imbinarize(f2, th);

figure(1);
subplot(3, 2, 1), imshow(f); % original image
subplot(3, 2, 2), imshow(fo); % opening image 
subplot(3, 2, 3), imshow(f2); % subtracted image
subplot(3, 2, 4), imshow(f22); % tophat image (direct function)
subplot(3, 2, 5), imshow(BW); % binarize with original image's level
subplot(3, 2, 6), imshow(BW_rice); % binarize with tophat image's level
