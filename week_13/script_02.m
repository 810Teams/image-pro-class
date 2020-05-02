%
% script_02.m
% Local Thresholding
%

clear all;
close all;
clc;

f = imread('img/rice.tif');

se = strel('disk', 10);
fo = imopen(f, se); % image opening

To = graythresh(fo); % automatic thresholding
T = fo + (To * 255); % local thresholding

% Binarize
[m, n] = size(f);
out = zeros(m, n);
out_idx = find(f >= T);
out(out_idx) = 1;

figure(1);
subplot(2, 2, 1), imshow(f);
subplot(2, 2, 2), imshow(fo);
subplot(2, 2, 3), imshow(T);
subplot(2, 2, 4), imshow(out);
