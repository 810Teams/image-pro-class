%
% script_02.m
% Line Detection
%

clear all;
close all;

f = imread('img/wirebond_mask.tif');

w = [2 -1 -1;
    -1  2 -1;
    -1 -1  2]; % -45 degrees mask
w45 = [-1 -1  2;
       -1  2 -1;
        2 -1 -1]; % 45 degrees mask
g = abs(imfilter(double(f), w));

gtop = g(1:120, 1:120);
gtop = pixeldup(gtop, 4);
gbot = g(end - 119:end, end - 119:end);
gbot = pixeldup(gbot, 4);

ga = abs(g);
T = max(ga(:));
gx = ga >= T;

figure(1);
subplot(2, 3, 1), imshow(f);
subplot(2, 3, 2), imshow(g, []);
subplot(2, 3, 3), imshow(gtop);
subplot(2, 3, 4), imshow(gbot, []);
subplot(2, 3, 5), imshow(ga);
subplot(2, 3, 6), imshow(gx, []);
