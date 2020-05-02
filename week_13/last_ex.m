%
% last_ex.m
%

clear all;
close all;
clc;

f = imread('img/gel.tif');
% image #1

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd, h, 'replicate').^2 + imfilter(fd, h', 'replicate').^2);
g1 = log2(1 + double(g));
% image #2

L = watershed(g);
wr = L == 0;
% image #3

rm = imregionalmin(g);
% image #4

im = imextendedmin(f, 2);
fim = f;
fim(im) = 175;
% image #5

Lim = watershed(bwdist(im));
em = Lim == 0;
% image #6

gg = mat2gray(g1);
g2 = imimposemin(gg, em | im);
% image #7

L2 = watershed(g2);
f2 = f;
f2(L2 == 0) = 255;
% image #8

figure(1);
subplot(2, 4, 1), imshow(f);
subplot(2, 4, 2), imshow(mat2gray(g1));
subplot(2, 4, 3), imshow(wr);
subplot(2, 4, 4), imshow(rm);
subplot(2, 4, 5), imshow(fim);
subplot(2, 4, 6), imshow(em);
subplot(2, 4, 7), imshow(g2);
subplot(2, 4, 8), imshow(f2);
