%
% watershed_g.m
%

clear all;
close all;
clc;

f = imread('img/blobs.tif');

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd, h, 'replicate').^2 + imfilter(fd, h', 'replicate').^2);

L = watershed(g);
wr = (L == 0);

g2 = imclose(imopen(g, ones(3, 3)), ones(3, 3));
L2 = watershed(g2);
wr2 = (L2 == 0);

figure(1);
subplot(2, 2, 1), imshow(f);
subplot(2, 2, 2), imshow(mat2gray(g));
subplot(2, 2, 3), imshow(wr);
subplot(2, 2, 4), imshow(wr2);
