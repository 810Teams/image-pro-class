%
% watershed_dt.m
%

clear all;
close all;
clc;

f = imread('img/bwdowels.tif');

gc = ~f;

D = bwdist(gc);

L = watershed(-D);

w = (L == 0);
g2 = f & ~w;

figure(1);
imshow(f);

figure(2);
subplot(2, 2, 1), imshow(gc);
subplot(2, 2, 2), imshow(mat2gray(D));
subplot(2, 2, 3), imshow(~L);
subplot(2, 2, 4), imshow(g2);
