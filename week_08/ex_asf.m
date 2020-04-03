%
% ex_asf.m
%

clear all;
close all;

f = imread('img/lena.bmp');
g = imnoise(f, 'salt & pepper', 0.2);
f1 = medfilt2(g, [3 3], 'symmetric');
f2 = adpmedian(g, 5);

figure(1);
subplot(2, 2, 1), imshow(f);
subplot(2, 2, 2), imshow(g);
subplot(2, 2, 3), imshow(f1);
subplot(2, 2, 4), imshow(f2);
