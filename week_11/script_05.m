%
% script_05.m
% Application: Smoothing using openings and closings
%

clear all;
close all;

f = imread('img/dowels.tif');
fasf = f;

for k = 2:5
    se = strel('disk', k);
    fasf = imclose(imopen(fasf, se), se);
end

figure(1);
subplot(1, 2, 1), imshow(f);
subplot(1, 2, 2), imshow(fasf);
