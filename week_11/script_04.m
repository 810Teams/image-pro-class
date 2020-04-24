%
% script_04.m
% Application: Smoothing using openings and closings
%

clear all;
close all;

f = imread('img/dowels.tif');
se = strel('disk', 5);
fo = imopen(f, se);
foc = imclose(f, se);

figure(1);
subplot(1, 3, 1), imshow(f);
subplot(1, 3, 2), imshow(fo);
subplot(1, 3, 3), imshow(foc);
