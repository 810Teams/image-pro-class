%
% script_03.m
% Morphological Gradient: MATLAB code
%

clear all;
close all;

f = imread('img/aerial.tif');

se = strel('square', 3);
gd = imdilate(f, se);
ge = imerode(f, se);
morph_grad = imsubtract(gd, ge);

figure(1);
subplot(2, 2, 1), imshow(f);
subplot(2, 2, 2), imshow(gd);
subplot(2, 2, 3), imshow(ge);
subplot(2, 2, 4), imshow(morph_grad);
