%
% script_01.m
% Point Detection
%

clear all;
close all;

f = imread('img/test_pattern_with_single_pixel.tif');

w = [-1 -1 -1;
     -1  8 -1;
     -1 -1 -1];

g = abs(imfilter(double(f), w));
T = max(g(:));
g = g >= T;

figure(1);
subplot(1, 2, 1), imshow(f);
subplot(1, 2, 2), imshow(g);
